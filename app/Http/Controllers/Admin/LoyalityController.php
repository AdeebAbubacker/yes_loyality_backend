<?php

namespace App\Http\Controllers\Admin;

use App\Exports\LoyaltyOfferExport;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;

use App\Models\User;
use App\Models\Store;
use App\Models\LoyaltyRule;
use App\Models\LoyalityOffer;
use App\Models\UserTransaction;
use App\Models\RegisteredDevices;

use App\Helpers\Firebase;

use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;

use Kreait\Firebase\Http\HttpClientOptions;
use GuzzleHttp\RequestOptions;


class LoyalityController extends Controller
{
    public function loyality_list()
    {
        $PageData = [
            "Title" => "Loyalty Offers",
            "PageName" => "LoyaltyListView",
            "Crumbs" => [
                "Loyalty Offers",
                "List",
            ],
            "PageTilte" => "Loyalty Offers"
        ];

        $Buttons = [
            [
                "type" => "button",
                "link" => "",
                "colour" => "success",
                "class" => "add-btn",
                "id" => "AddDataModelToggle",
                "text" => '<i class="ri-add-line align-bottom me-1"></i> Add',
            ],
            [
                "type" => "button",
                "link" => "",
                "colour" => "danger",
                "class" => "add-btn",
                "id" => "ExportData",
                "text" => '<i class=" ri-chat-download-line align-bottom me-1"></i></i>Export',
            ]
        ];
        return view('2_AdminPanel.4_SingleUseViews.CommonTableView', compact('PageData', 'Buttons'));
    }

    public function loyality_form(Request $request, $id = NULL)
    {
        $readonly = $request->readonly;
        $duplicate = $request->duplicate;


        if (Auth::user()->role_id > 2) {
            $branches = Store::where('stores.id', Auth::user()->branch)->get();
        } else {
            $branches = Store::get();
        }
        if ($id) {
            $Offer = LoyalityOffer::select([
                'loyality_offers.id',
                'loyality_offers.name',
                'loyality_offers.comments',
                'loyality_offers.branch_id',
                'stores.name AS branch_name',
                'loyality_offers.offer_code',
                'loyality_offers.slug',
                'loyality_offers.min_inv_amt',
                'loyality_offers.max_reduction',
                'loyality_offers.points_required',
                'loyality_offers.discount_val',
                'loyality_offers.discount_type',
                'loyality_offers.usage_limit',
                'loyality_offers.expiry_start',
                'loyality_offers.expiry_end',
                'loyality_offers.active',
            ])->leftJoin('stores', 'stores.id', 'loyality_offers.branch_id')
                ->find($id);


            $View = view("2_AdminPanel.3_Components.1_Pages.LoyalityListView.AddDataForm", compact('Offer', 'readonly', 'branches', 'duplicate'))->render();
        } else {
            $View = view("2_AdminPanel.3_Components.1_Pages.LoyalityListView.AddDataForm", compact('branches'))->render();
        }


        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_list()
    {

        $query = LoyalityOffer::select([
            'loyality_offers.id',
            'loyality_offers.name',
            'loyality_offers.comments',
            'loyality_offers.branch_id',
            'stores.name AS branch_name',
            'loyality_offers.offer_code',
            'loyality_offers.slug',
            'loyality_offers.min_inv_amt',
            'loyality_offers.max_reduction',
            'loyality_offers.points_required',
            'loyality_offers.discount_val',
            'loyality_offers.discount_type',
            'loyality_offers.usage_limit',
            'loyality_offers.expiry_start',
            'loyality_offers.expiry_end',
            'loyality_offers.active',
            'loyality_offers.created_at',
        ])->leftJoin('stores', 'stores.id', 'loyality_offers.branch_id')
            ->orderBy('created_at', 'DESC');

        if (Auth::user()->role_id > 2) {
            $offer_list = $query->where('loyality_offers.branch_id', Auth::user()->branch)->get();
        } else {
            $offer_list = $query->get();
        }

        return ArrayResp(
            Data: $offer_list,
            Message: "Loyality Offers fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }


    public function info(Request $request)
    {
        $now = Carbon::now();

        LoyalityOffer::where('expiry_end', '<', $now)
            ->where('active', 1)
            ->update(['active' => 0]);

        $info = LoyalityOffer::find($request->offer_id);

        return ArrayResp(
            Data: $info,
            Message: "Loyality Offers fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function add(Request $request)
    {
        $fcm_tokens = RegisteredDevices::all_fcm_tokens();
        
        Firebase::devices($fcm_tokens) 
            ->title('New offer from Yes Yes Indian Supermarket')
            ->body('We have [x% or $y] offer for [product]. Please hurry up!')
            ->group(Firebase::NEW_OFFER)
            // ->image('')
            ->link('https://yesyesloyalty.agatebc.in')
            // ->deep_link('')
            ->notify();

        foreach ($request->input('branch_id') as $branchId) {
            LoyalityOffer::create([
                'name' => $request->name,
                'comments' => $request->comment,
                'branch_id' => $branchId,
                'slug' => $request->slug,
                'min_inv_amt' => $request->min_inv_amt,
                'max_reduction' => $request->max_reduction ?? null,
                'points_required' => $request->points_required,
                'discount_val' => $request->discount_val,
                'discount_type' => $request->discount_type,
                'usage_limit' => $request->usage_limit ?? null,
                'expiry_start' => $request->expiry_start,
                'expiry_end' => $request->expiry_end ?? null,
                'offer_code' => generateUniqueRandomCode(6),
                'active' => $request->status
            ]);

        }


        return ArrayResp(
            Message: "Loyality Offers Added Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function edit(Request $request)
    {

        $offer = LoyalityOffer::find($request->id);

        $offer->update([
            'name' => $request->name,
            'comments' => $request->comment,
            'branch_id' => $request->branch_id,
            'slug' => $request->slug,
            'min_inv_amt' => $request->min_inv_amt,
            'max_reduction' => $request->max_reduction ?? null,
            'points_required' => $request->points_required,
            'discount_val' => $request->discount_val,
            'discount_type' => $request->discount_type,
            'usage_limit' => $request->usage_limit ?? null,
            'expiry_start' => $request->expiry_start,
            'expiry_end' => $request->expiry_end ?? null,
            'active' => $request->status
        ]);

        return ArrayResp(
            Message: "Loyality Offer updated Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function delete($id)
    {
        $record = LoyalityOffer::find($id);
        $record->delete();

        return ArrayResp(
            Message: "Loyality Offer Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function offer_list(Request $request)
    {

        if (in_array(Auth::user()->role_id, [1, 2])) {
            // $user = User::find($request->cashier_id);
            $branch_id = $request->store_id;
        } else {
            $branch_id = Auth::user()->branch;
        }

        $offer_list = LoyalityOffer::select([
            'loyality_offers.id',
            'loyality_offers.name',
            'loyality_offers.comments',
            'loyality_offers.branch_id',
            'stores.name AS branch_name',
            'loyality_offers.offer_code',
            'loyality_offers.slug',
            'loyality_offers.min_inv_amt',
            'loyality_offers.max_reduction',
            'loyality_offers.points_required',
            'loyality_offers.discount_val',
            'loyality_offers.discount_type',
            'loyality_offers.usage_limit',
            'loyality_offers.expiry_start',
            'loyality_offers.expiry_end',
            'loyality_offers.active',
        ])->leftJoin('stores', 'stores.id', 'loyality_offers.branch_id')
            ->where('loyality_offers.branch_id', $branch_id)
            ->where('loyality_offers.min_inv_amt', '<=', $request->invoice_cost)
            ->where('loyality_offers.points_required', '<=', $request->balance_points)
            ->where('loyality_offers.active', 1)
            ->get();

        return ArrayResp(
            Data: $offer_list,
            Message: "Loyality Offers fetched Succesfully!",
            NeedCount: true,
            Misc: []
        );
    }

    public function transaction(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'invoice_no' => 'nullable|unique:user_transactions',
            'invoice_cost' => 'required',

        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
        $user = User::where('users.customer_id', $request->user_name)->first();

        if ($request->offer != null) {
            $offer = LoyalityOffer::find($request->offer);
            $coin_type = 'debit';
            $coins = $offer->points_required;

            if ($offer->discount_type == 'percent') {
                $reduced_cost = $request->invoice_cost * ($offer->discount_val / 100);
            } else if ($offer->discount_type == 'amount') {
                $reduced_cost = $request->invoice_cost - $offer->discount_val;
            }

            if ($reduced_cost >= $offer->max_reduction && $offer->max_reduction != null) {
                $reduced_cost = $offer->max_reduction;
            }

            $final_cost = $request->invoice_cost - $reduced_cost;


            $wallet_total = $user->wallet_total + 0;
            $wallet_used = $user->wallet_used + $coins;
            $wallet_balance = $user->wallet_balance - $coins;
            $offer_message = 'Customer availed discount on current transaction';
        } else {
            $coin_type = 'credit';
            $rules = LoyaltyRule::orderBy('min_amt', 'asc')->get();
            $coins = 0;
            foreach ($rules as $rule) {
                if ($request->invoice_cost >= $rule['min_amt']) {
                    $coins = $rule['point_received'];
                }
            }
            $final_cost = $request->invoice_cost;

            $wallet_total = $user->wallet_total + $coins;
            $wallet_used = $user->wallet_used + 0;
            $wallet_balance = $user->wallet_balance + $coins;
            if ($coins == 0) {
                $offer_message = "No points added to customer account.";
            } else {
                $offer_message = "{$coins} points added to customer account.";

            }
        }

        if (in_array(Auth::user()->role_id, [1, 2])) {
            $cashier_id = $request->cashier_name;
            $store_id = $request->store_name;
        } else {
            $cashier_id = Auth::user()->id;
            $store_id = Auth::user()->branch;
        }


        $loyality_transaction = UserTransaction::create([
            'user_id' => $user->id,
            'store_id' => $store_id,
            'cashier_id' => $cashier_id,
            'invoice_no' => $request->invoice_no ?? null,
            'invoice_amt' => $request->invoice_cost,
            'offer_id' => $request->offer ?? null,
            'coin_type' => $coin_type,
            'coins' => $coins,
            'final_amt' => $final_cost,

        ]);


        $user->update([
            'wallet_total' => $wallet_total,
            'wallet_used' => $wallet_used,
            'wallet_balance' => $wallet_balance,
        ]);


        return ArrayResp(
            Data: $loyality_transaction,
            Message: $offer_message,
            NeedCount: FALSE,
            Misc: []
        );
    }

    // public function qr_transaction(Request $request)
    // {

    //     // $validator = Validator::make($request->all(), [
    //     //     'invoice_no' => 'required|unique:user_transactions',
    //     // ]);

    //     // if ($validator->fails()) {
    //     //     return ArrayBadResp(
    //     //         Data: $validator->messages(),
    //     //         Message: "Validation Errors!",
    //     //         Misc: [],
    //     //         RespCode: 500,
    //     //     );
    //     // }



    //     $user_id = $request->user_id;
    //     $store_id = $request->store_id;
    //     $cashier_id = $request->cashier_id;
    //     $loyalty_id = $request->loyalty_id;

    //     $user = User::where('users.customer_id', $request->user_name)->first();


    //     $current_wallet_total =  $user->wallet_total;
    //     $current_wallet_used = $user->wallet_used;
    //     $current_wallet_balance = $user->wallet_balance;

    //     $offer = LoyalityOffer::first();
    //     $offer_points_required = $offer->points_required;

    //     if($current_wallet_balance >= $offer_points_required) {
    //         $coin_type = 'debit';
    //         $coins = $offer->points_required;

    //         if ($offer->discount_type == 'percent') {
    //             $reduced_cost = $request->invoice_cost * ($offer->discount_val / 100);
    //         } else if ($offer->discount_type == 'amount') {
    //             $reduced_cost = $request->invoice_cost - $offer->discount_val;
    //         }

    //         if ($reduced_cost >= $offer->max_reduction && $offer->max_reduction != null) {
    //             $reduced_cost = $offer->max_reduction;
    //         }

    //         $final_cost = $request->invoice_cost - $reduced_cost;

    //         $wallet_total =  $user->wallet_total + 0;
    //         $wallet_used = $user->wallet_used + $coins;
    //         $wallet_balance = $user->wallet_balance - $coins;

    //     }
    //     else {
    //         $coin_type = 'credit';
    //         $rules = LoyaltyRule::orderBy('min_amt', 'asc')->get();
    //         foreach ($rules as $rule) {
    //             if ($request->invoice_cost >= $rule['min_amt']) {
    //                 $coins = $rule['point_received'];
    //             }
    //         }
    //         $final_cost = $request->invoice_cost;

    //         $wallet_total = $user->wallet_total + $coins;
    //         $wallet_used = $user->wallet_used + 0;
    //         $wallet_balance = $user->wallet_balance + $coins;
    //     }

    //     if (in_array(Auth::user()->role_id, [1, 2])) {
    //         $cashier_id = $request->cashier_name;
    //         $store_id = $request->store_name;
    //     } else {
    //         $cashier_id = Auth::user()->id;
    //         $store_id = Auth::user()->branch;
    //     }


    //     $loyality_transaction = UserTransaction::create([
    //         'user_id' => $user->id,
    //         'store_id' => $store_id,
    //         'cashier_id' => $cashier_id,
    //         'invoice_no' => $request->invoice_no,
    //         'invoice_amt' => $request->invoice_cost,
    //         'offer_id' => $request->offer ?? null,
    //         'coin_type' => $coin_type,
    //         'coins' => $coins,
    //         'final_amt' => $final_cost,

    //     ]);


    //     $user->update([
    //         'wallet_total' => $wallet_total,
    //         'wallet_used' =>  $wallet_used,
    //         'wallet_balance' => $wallet_balance,
    //     ]);


    //     return ArrayResp(
    //         Data: $loyality_transaction,
    //         Message: "Loyality Transaction Added Succesfully!",
    //         NeedCount: FALSE,
    //         Misc: []
    //     );
    // }

    public function loyality_rules()
    {
        $loyality_rules_fetch = LoyaltyRule::orderBy('min_amt', 'asc')->get();

        // $loyality_rules = [];

        // foreach($loyality_rules_fetch as $key => $rule) {
        //     $loyality_rules[$rule['max_amt']] = $rule;
        // }

        return ArrayResp(
            Data: $loyality_rules_fetch,
            Message: "Loyality Rules fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function add_user(Request $request, $id = NULL)
    {

        $View = view("2_AdminPanel.3_Components.1_Pages.LoyalityAddUser.AddDataForm")->render();

        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function export()
    {
        return Excel::download(new LoyaltyOfferExport, 'loyaltyoffer.xlsx');
    }
}
