<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\LoyaltyRule;
use Illuminate\Http\Request;
use App\Models\LoyalityOffer;
use App\Models\LoyaltyRuleQr;
use App\Models\UserTransaction;
use App\Http\Controllers\Controller;
use App\Models\Store;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Propaganistas\LaravelPhone\PhoneNumber;

class AppController extends Controller
{

    public function dashboard(Request $request)
    {
        $user = Auth::user();
        $id = $user->id;

        $user = User::find($id);

        $phone = new PhoneNumber($user->phone);
        $country_alpha_code = $phone->getCountry();

        $user['country_alpha_code'] = $country_alpha_code;

        $country_code = explode(' ', $phone->formatInternational());
        $user['country_code'] = $country_code[0];

        $phone_number = implode(array_slice($country_code, 1));
        $user['phone_number'] = $phone_number;

        if ($user->image) {
            $img_url = 'https://yesyesloyalty.agatebc.in/storage/file_uploads/user/' . $user->id . '/' . $user->image;
            $user['img_url'] = $img_url;
        } else {
            $user['img_url'] = null;
        }



        $branch_id = $request->branch ?? $user->branch ?? LoyalityOffer::min('branch_id');

        $store_loyality_offer = LoyalityOffer::where('branch_id', $branch_id)
            ->where('active', 1)
            ->latest()
            ->first();

        $offer_points_required = $store_loyality_offer->points_required;
        $points_required = $offer_points_required - (Auth::user()->wallet_balance ?? 0);

        return ArrayResp(
            Data: [
                'user' => $user,
                'offer' => $store_loyality_offer, // 'loyality_offer' => $store_loyality_offer,
                'offer_eligibility' => [
                    'status' => (Auth::user()->wallet_balance >= $offer_points_required) ? true : false,
                    'points_required' => ($points_required < 0) ? 0 : $points_required,
                ]
            ],
            Message: "User Details Fetched Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }
    public function scan_qr_code(Request $request)
    {
        $messages = [
            'qr_id.exists' => 'The scanned QR code is invalid.'
        ];
        // Validation Rules
        $validator = Validator::make($request->all(), [
            'qr_id' => 'required|exists:loyalty_rule_qrs,qr_id',
            // 'customer_id' => 'required|numeric|exists:users,customer_id',
        ], $messages);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        // Fetch QR Data
        $qr_id = $request->qr_id;
        $qr_data = LoyaltyRuleQr::where('qr_id', $qr_id)->first();

        // Fetch Customer Info
        // $customer_id = $request->customer_id ?? Auth::user()->id;
        // $user = User::where('users.customer_id', $customer_id)->first();

        $user = Auth::user();

        // * Uncomment if client needs to re-impliment strict same-day QR Code Generation
        // Check if QR is Expired
        // if ($qr_data->date != Carbon::today()) {
        //     return ArrayBadResp(
        //         Data: [],
        //         Message: "QR Code Expired!",
        //         Misc: [],
        //         RespCode: 500,
        //     );
        // }

        $cashier = User::find($qr_data->user_id);
        $store = Store::find($qr_data->store_id);

        // Fetch LATEST Loyality Offer SPECIFIC to a store
        $store_loyality_offer = LoyalityOffer::where('branch_id', $store->id)
            ->where('active', 1)
            ->latest()
            ->first();

        $Qr_loyalty_rule_details = LoyaltyRule::find($qr_data->rule_id);

        // * Uncomment if client needs to re-impliment strict 1 scan per day per cashier for Customers
        // $same_day_transaction = UserTransaction::where('user_id', $user->id)
        //     ->where('store_id', $store->id)
        //     ->where('cashier_id', $cashier->id)
        //     ->whereDate('created_at', Carbon::today())
        //     ->exists();

        // // Error if the customer scanned loyalty QR from the SAME CASHIER on SAME DAY!
        // if($same_day_transaction) {
        //     return ArrayBadResp(
        //         Data: [],
        //         Message: "Loyalty Already Credited Today!\nPlease approach Cashier!",
        //         Misc: [],
        //         RespCode: 500,
        //     );
        // }

        $offer_points_required = $store_loyality_offer->points_required;
        $eligible_for_offer = $user->wallet_balance >= $offer_points_required;

        // Eligible for Offer. Offer Applied!
        if ($eligible_for_offer) {
            $loyalty_status = 'offer_applied';
            $transaction_type = 'debit';

            $loyalty_points_value = $offer_points_required;

            $updated_wallet = [
                'wallet_total' => $user->wallet_total + 0,
                'wallet_used' =>  $user->wallet_used + $loyalty_points_value,
                'wallet_balance' => $user->wallet_balance - $offer_points_required,
            ];

            $loyalty_message = 'You availed discount on current transaction';
        }
        // NOT Eligible for Offer. Loyalty Credited!
        else {
            $loyalty_points_value = $Qr_loyalty_rule_details->point_received;
            $transaction_type = 'credit';

            $updated_wallet = [
                'wallet_total' => $user->wallet_total + $loyalty_points_value,
                'wallet_used' =>  $user->wallet_used + 0,
                'wallet_balance' => $user->wallet_balance + $loyalty_points_value,
            ];

            if ($updated_wallet['wallet_balance'] >= $offer_points_required) {
                $loyalty_status = 'offer_eligible';
                $loyalty_message = "{$loyalty_points_value} points added to your account. You can redeem the offer in next purchase.";
            } else {
                $loyalty_status = 'loyalty_credited';
                $loyalty_message = "{$loyalty_points_value} points added to your account. You need " . (max(0, $offer_points_required - $updated_wallet['wallet_balance'])) . " more points to redeem the offer.";
            }
        }

        $transaction_id = UserTransaction::insertGetId([
            'user_id' => $user->id,
            'store_id' => $store->id,
            'cashier_id' => $cashier->id,
            // 'invoice_no' => $request->invoice_no,
            // 'invoice_amt' => $Qr_loyalty_rule_details->min_amt,
            'offer_id' => $eligible_for_offer ? $store_loyality_offer->id : null,
            'coin_type' => $transaction_type,
            'coins' => $loyalty_points_value,
            // 'final_amt' => $final_cost,
            // 'created_at' => Carbon::today(),
        ]);

        if (!$transaction_id) {
            return ArrayBadResp(
                Data: [],
                Message: "Loyalty NOT Credited! Please try again!",
                Misc: [],
                RespCode: 500,
            );
        }

        $user->update($updated_wallet);

        $points_required = $offer_points_required - (Auth::user()->wallet_balance ?? 0);

        $transaction = UserTransaction::find($transaction_id);


        $date = Carbon::parse($transaction->created_at);
        $date->setTimezone('Australia/Melbourne');
        $formattedDate = $date->format('Y-m-d H:i:s');
        
        return ArrayResp(
            Data: [
                'loyalty_status' => $loyalty_status, // Changed from offer_status to loyalty_status
                // 'transaction_type' => $transaction_type, // Changed from point_type to transaction_type
                // 'transaction_value' => $loyalty_points_value, // Changed from points to transaction_value

                'store' => $store,
                'cashier' => $cashier,

                'offer' => $store_loyality_offer, // Changed from offer_detail to loyalty_offer

                'transaction' => [
                    'id' => $transaction_id,
                    'transaction_type' => $transaction_type,
                    'transaction_value' => $loyalty_points_value,
                    'transaction_time' => $formattedDate,
                    // 'time_now' => carbon::now()
                ],

                'updated_wallet' => $updated_wallet,

                'offer_eligibility' => [
                    'status' => (Auth::user()->wallet_balance >= $offer_points_required) ? true : false,
                    'points_required' => ($points_required < 0) ? 0 : $points_required,
                ]
            ],
            Message: $loyalty_message,
            NeedCount: FALSE,
            Misc: []
        );
    }

    // OLD CODE. NOT NEEDED.
    public function qr_transaction(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'qr_id' => 'required|exists:loyalty_rule_qrs,qr_id',
            'customer_id' => 'required|numeric|exists:users,customer_id',
        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        $qr_id = $request->qr_id;
        $customer_id = $request->customer_id;

        $user = User::where('users.customer_id', $customer_id)->first();
        $qr_detail = LoyaltyRuleQr::where('loyalty_rule_qrs.qr_id', $qr_id)->first();

        if ($qr_detail->date != Carbon::today()) {
            $error = [
                'offer_status' => 'qr_expired',
            ];

            return ArrayBadResp(
                Data: $error,
                Message: "QR Expired!",
                Misc: [],
                RespCode: 500,
            );
        }

        $store_id = $qr_detail->store_id;

        $cashier = User::find($qr_detail->user_id);
        $store = Store::find($store_id);

        $rule_detail = LoyaltyRule::find($qr_detail->rule_id);

        $same_day_transaction = UserTransaction::where('user_id', $user->id)
            ->where('store_id', $store_id)
            ->where('cashier_id', $qr_detail->user_id)
            ->whereDate('created_at', Carbon::today())->get();

        // print_r($same_day_transaction->toArray()); exit;

        if ($same_day_transaction) {
            return ArrayBadResp(
                Data: [],
                Message: "Loyalty Already Credited Today!\nPlease approach Cashier!",
                Misc: [],
                RespCode: 500,
            );
        }

        $offer = LoyalityOffer::select(
            'id',
            'name',
            'comments',
            'offer_code',
            'min_inv_amt',
            'points_required',
            'discount_val',
            'discount_type'
        )->orderBy('created_at', 'asc')
            ->where('active', 1)
            ->latest()
            ->first();

        $offer_points = $offer->points_required;



        if ($offer_points <= $user->wallet_balance) {

            $coin_type = 'debit';
            $coins = $offer->points_required;
            $wallet_total =  $user->wallet_total + 0;
            $wallet_used = $user->wallet_used + $coins;
            $wallet_balance = $user->wallet_balance - $coins;
            $offer_id = $offer->id;
            $offer_status = 'offer_applied';
            $offer_message = 'You availed discount on current transaction';
            $offer_detail = $offer;
        } else {
            $coin_type = 'credit';
            $coins =  $rule_detail->point_received;
            $wallet_total = $user->wallet_total + $coins;
            $wallet_used = $user->wallet_used + 0;
            $wallet_balance = $user->wallet_balance + $coins;
            $offer_id = null;
            $offer_detail = null;
            if ($wallet_balance > $offer_points) {
                $offer_status = 'offer_eligible';
                $offer_message = "{$coins} points added to your account. You can redeem the offer in next purchase.";
            } else {
                $offer_status = 'loyalty_credited';
                $offer_message = "{$coins} points added to your account. You need " . (max(0, $offer_points - $wallet_balance)) . " more points to redeem the offer.";
            }
        }

        $loyality_id = UserTransaction::insertGetId([
            'user_id' => $user->id,
            'store_id' => $store_id,
            'cashier_id' => $qr_detail->user_id,
            // 'invoice_no' => $request->invoice_no,
            'invoice_amt' => $rule_detail->min_amt,
            'offer_id' => $offer_id,
            'coin_type' => $coin_type,
            'coins' => $coins,
            // 'final_amt' => $final_cost,
        ]);

        $user->update([
            'wallet_total' => $wallet_total,
            'wallet_used' =>  $wallet_used,
            'wallet_balance' => $wallet_balance,
        ]);

        $transaction = UserTransaction::find($loyality_id);
        $created_at = $transaction->created_at;


        $transaction_data = [
            'offer_status' => $offer_status,
            'point_type' => $coin_type,
            'points' => $coins,
            'store_name' => $store->name,
            'cashier' => $cashier->name,
            'offer_detail' => $offer_detail,
            'transaction_id' => $transaction->id,
            'created_at' => $created_at
        ];

        return ArrayResp(
            Data: $transaction_data,
            Message: $offer_message,
            NeedCount: FALSE,
            Misc: []
        );
    }
}
