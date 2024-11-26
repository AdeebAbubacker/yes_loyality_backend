<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Store;
use ZipStream\ZipStream;
use App\Models\LoyaltyRule;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\LoyaltyRuleQr;
use Illuminate\Support\Carbon;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use File;
use ZipArchive;


class RulesController extends Controller
{

    public function list()
    {
        $PageData = [
            "Title" => "Rules",
            "PageName" => "RulesList",
            "Crumbs" => [
                "Rules",
                "List",
            ],
            "PageTilte" => "Rules"
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
            // [
            //     "type" => "button",
            //     "link" => "",
            //     "colour" => "danger",
            //     "class" => "add-btn",
            //     "id" => "GenrateQr",
            //     "text" => 'GenrateQr',
            // ],
        ];

        $select = 1;

        $stores = Store::where('active', 1)->get();
        $users = User::where('role_id', 4)->where('active', 1)->get();


        return view('2_AdminPanel.4_SingleUseViews.CommonTableView', compact('PageData', 'Buttons', 'select', 'stores', 'users'));
    }

    public function form(Request $request, $id = NULL)
    {
        $readonly = $request->readonly;
        if ($id) {
            $rule = LoyaltyRule::find($id);
            $View = view("2_AdminPanel.3_Components.1_Pages.RulesListView.AddDataForm", compact('rule', 'readonly'))->render();
        } else {
            $View = view("2_AdminPanel.3_Components.1_Pages.RulesListView.AddDataForm")->render();
        }


        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch()
    {

        // $rules = LoyaltyRule::select(
        //     'loyalty_rules.id',
        //     'loyalty_rules.min_amt',
        //     'loyalty_rules.point_received',
        //     DB::raw('(SELECT qr.qr_image
        //     FROM loyalty_rule_qrs qr 
        //     JOIN loyalty_rules lr ON qr.rule_id = lr.id
        //     WHERE qr.user_id = ' . Auth::user()->id . '
        //     AND qr.date = CURDATE()
        //     ORDER BY qr.created_at DESC
        //     LIMIT 1) AS latest_qr') ?? null
        // )->orderBy('min_amt', 'asc')
        //     ->get();

        $rules = LoyaltyRule::select(
            'loyalty_rules.id',
            'loyalty_rules.min_amt',
            'loyalty_rules.point_received',
            DB::raw('COALESCE(qr.qr_id, null) AS qr_id'),
            DB::raw('COALESCE(qr.qr_image, null) AS latest_qr'),
            DB::raw('COALESCE(qr.date, null) AS qr_date'),
            DB::raw('COALESCE(stores.name, null) AS store_name'),
            DB::raw('COALESCE(users.name, null) AS cashier_name')

        )->leftJoin('loyalty_rule_qrs AS qr', function ($join) {
            $join->on('qr.rule_id', '=', 'loyalty_rules.id')
                ->where('qr.user_id', '=', Auth::user()->id)
                ->whereDate('qr.date', '=', Carbon::today());
        })->leftJoin('stores', 'stores.id', 'qr.store_id')
            ->leftJoin('users', 'users.id', 'qr.user_id')
            ->orderBy('min_amt', 'asc')
            ->get();


        // dd($rules);
        // print_r($rules->toArray());
        // exit();


        $rules = $rules->map(function ($rule, $key) use ($rules) {
            if ($key < $rules->count() - 1) {
                $rule->next_min_amount = $rules[$key + 1]->min_amt;
            } else {
                unset($rule->next_min_amount); // Remove next_min_amount for the last row
            }
            return $rule;
        });

        return ArrayResp(
            Data: $rules,
            Message: "Rules fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }


    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'min_amt' => [
                'required',
                Rule::unique('loyalty_rules')->whereNull('deleted_at')
            ],
            'point' => 'required',
        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }
        $rules = LoyaltyRule::create([
            'min_amt' => $request->min_amt,
            'point_received' => $request->point,
        ]);

        return ArrayResp(
            Data: $rules,
            Message: "Rules Created Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function edit(Request $request)
    {
        $rule = LoyaltyRule::find($request->id);

        $validator = Validator::make($request->all(), [
            'min_amt' => [
                Rule::unique('loyalty_rules')->ignore($rule->id),
                'required',
            ],
            'point' => 'required',
        ]);

        if ($validator->fails()) {
            return ArrayBadResp(
                Data: $validator->messages(),
                Message: "Validation Errors!",
                Misc: [],
                RespCode: 500,
            );
        }

        $rule->update([
            'min_amt' => $request->min_amt,
            'point_received' => $request->point,
        ]);
        return ArrayResp(
            Data: $rule,
            Message: "Rules Updated Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function delete($id)
    {
        $record = LoyaltyRule::find($id);
        $record->delete();

        return ArrayResp(
            Message: "Rule Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function generate_rule_qr(Request $request)
    {
        $rules = LoyaltyRule::get();
        $date = $request->date ?? Carbon::today();

        // Super Admin & Admin
        if (in_array(Auth::user()->role_id, [1, 2])) {
            $branches = Store::where('active', 1)->get();
        }

        // Store Manager
        if (Auth::user()->role_id == 3) {
            $branches = Store::where('id', Auth::user()->branch)->where('active', 1)->get();
        }


        $qr_generated = [];

        foreach ($branches as $branch) {

            $branch_id = $branch->id;

            $cashiers = User::where('branch', $branch_id);

            if (Auth::user()->role_id == 3) {
                $cashiers = $cashiers->get();
            } else {
                $cashiers = $cashiers->where('role_id', 4)->where('active', 1)->get();
            }

            // Only proceed if there are active cashiers in the branch
            if (!$cashiers->isEmpty()) {

                foreach ($cashiers as $cashier) {
                    $cashier_id = $cashier->id;

                    foreach ($rules as $rule) {
                        $rule_id = $rule->id;
                        $qr_id = Str::random(40);
                        $qr_image = QrCode::size(256)
                            ->format('png')
                            ->margin(1)
                            ->generate($qr_id);

                        $qr_image_base64 = base64_encode($qr_image);
                        // $qr_image_base64 = base64_encode($qr_id);

                        $data = [
                            'rule_id' => $rule_id,
                            'store_id' => $branch_id,
                            'user_id' => $cashier_id,
                            // other fields you want to upsert
                        ];

                        $updateData = [
                            'qr_id' => $qr_id,
                            'date' => $date,
                            'created_by' => Auth::user()->id,
                            'qr_image' => $qr_image_base64,
                        ];

                        $qr_content = [
                            'qr_id' => $qr_id,
                            'rule_id' => $rule_id,
                            'store_id' => $branch_id,
                            'user_id' => $cashier_id,
                            'date' => $date,
                            'created_by' => Auth::user()->id,
                            'qr_image' => $qr_image_base64,
                        ];

                        // Using upsert to ensure unique entries based on the specified columns
                        // LoyaltyRuleQr::upsert(
                        //     [$qr_content],
                        //     ['rule_id', 'store_id', 'user_id'], // Columns for finding existing records
                        //     ['qr_id', 'date', 'created_by', 'qr_image'], // Columns to be updated
                        // );
                        LoyaltyRuleQr::updateOrInsert($data, $updateData);
                        $qr_generated[] = $qr_content; // Keep track of generated rules
                    }
                }
            }
        }

        return ArrayResp(
            Data: $qr_generated,
            Message: "Rule QRs Created Successfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function qr_page($id)
    {
        $query = LoyaltyRuleQr::select(
            'loyalty_rule_qrs.id',
            'loyalty_rule_qrs.qr_id',
            'loyalty_rule_qrs.rule_id',
            'loyalty_rules.min_amt AS minimum_amount',
            'loyalty_rule_qrs.store_id',
            'stores.name AS store_name',
            'loyalty_rule_qrs.user_id',
            'users.name AS cashier_name',
            'loyalty_rule_qrs.date',
            'loyalty_rule_qrs.qr_image',
            'loyalty_rule_qrs.created_by',
        )->leftjoin('stores', 'stores.id', 'loyalty_rule_qrs.store_id')
            ->leftjoin('users', 'users.id', 'loyalty_rule_qrs.user_id')
            ->leftjoin('loyalty_rules', 'loyalty_rules.id', 'loyalty_rule_qrs.rule_id')
            // ->where('loyalty_rule_qrs.date', Carbon::today())
            ->where('loyalty_rule_qrs.rule_id', $id);


        if (in_array(Auth::user()->role_id, [1, 2])) {

            $qr_codes =  $query->get();
        }

        if (Auth::user()->role_id == 3) {

            $qr_codes =  $query->where('store_id', Auth::user()->branch)->get();
        }

        if (Auth::user()->role_id == 4) {

            $qr_codes =  $query->where('store_id', Auth::user()->branch)->where('user_id', Auth::user()->id)->get();
        }

        $View = view("2_AdminPanel.3_Components.1_Pages.RulesListView.Qr", compact('qr_codes'))->render();

        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function download_zip()
    {
        $qr_data = LoyaltyRuleQr::select('loyalty_rule_qrs.*', 'users.name as user_name', 'loyalty_rules.min_amt as rule_name')
            ->leftJoin('users', 'loyalty_rule_qrs.user_id', '=', 'users.id')
            ->leftJoin('loyalty_rules', 'loyalty_rule_qrs.rule_id', '=', 'loyalty_rules.id')
            ->where('loyalty_rule_qrs.date', Carbon::today())
            ->where('loyalty_rule_qrs.store_id', Auth::user()->branch);

        if($qr_data->count() == 0){ 
            return ArrayBadResp(
                Message: "You should Generate QR first",
                Misc: [],
                RespCode: 500,
            );
        }           

        // Filter based on user role (optional)
        if (Auth::user()->role_id == 3) {
            $qr_data = $qr_data->get();
        } elseif (Auth::user()->role_id == 4) {
            $qr_data = $qr_data->where('loyalty_rule_qrs.user_id', Auth::user()->id)->get();
        }

        $store_name = Store::where('id', Auth::user()->branch)->pluck('name')->first();
        $today = Carbon::now()->format('d-m-Y');

        $zipFileName = "LoyaltyQR_{$today}_{$store_name}.zip";

        $tmp_file = tempnam(sys_get_temp_dir(), 'zip');

        // Create a new ZipArchive instance
        $zip = new ZipArchive;

        if ($zip->open($tmp_file, ZipArchive::CREATE | ZipArchive::OVERWRITE) === TRUE) {
            foreach ($qr_data as $image) {
                $imageData = base64_decode($image->qr_image);
                $rule_name = (int)$image->rule_name;
                $user_name = $image->user_name;
                $imageName = "{$rule_name}_{$user_name}_{$today}.jpg"; // Assuming images are JPEGs

                // Check if imageData is valid
                if ($imageData !== false) {
                    // Add the image data to the zip file
                    $zip->addFromString($imageName, $imageData);
                }
            }
            $zip->close();
        } else {
            // Handle error opening zip file
            return response()->json(['error' => 'Failed to create zip file.'], 500);
        }

        // Clean output buffer
        if (ob_get_length()) ob_end_clean();

        // Return the zip file as a download response
        return response()->download($tmp_file, $zipFileName, [
            'Content-Disposition' => 'attachment; filename="' . $zipFileName . '"'
        ])->deleteFileAfterSend(true);
    }
}
