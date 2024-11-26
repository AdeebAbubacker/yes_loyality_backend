<?php

namespace App\Http\Controllers\Admin;

use App\Exports\StoreExport;
use App\Exports\StoreOfferExport;
use App\Models\Store;
use App\Models\AppSetting;
use App\Models\StoreOffer;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;

class StoreController extends Controller
{
    public function store_list()
    {
        $PageData = [
            "Title" => "Store",
            "PageName" => "StoreListView",
            "Crumbs" => [
                "Store",
                "List",
            ],
            "PageTilte" => "Stores"
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

    public function store_form(Request $request, $id = NULL)
    {
        $readonly = $request->readonly;
        // $price_plan = PricePlanGroup::get();

        $count = AppSetting::count();
        if ($count == 0) {
            $merchant_name = '';
        } else {
            $merchant_name = AppSetting::find('app_name');
            $merchant_name = $merchant_name->value;
        }



        if ($id) {
            $Store = Store::find($id);
            $View = view("2_AdminPanel.3_Components.1_Pages.StoreListView.AddDataForm", compact('Store', 'readonly'))->render();
        } else {
            $View = view("2_AdminPanel.3_Components.1_Pages.StoreListView.AddDataForm", compact('merchant_name'))->render();
        }


        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_store()
    {

        $stores = Store::get();

        return ArrayResp(
            Data: $stores,
            Message: "Store fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function add(Request $request)
    {

        $store = Store::create([
            'name' => $request->name,
            'location' => $request->location,
            'address' => $request->address,
            'coordinates' => $request->coordinates,
            'key_name' => $request->key_name,
            'support_name' => $request->support_name ?? null,
            'email_1' => $request->email_1,
            'email_2' => $request->email_2 ?? null,
            'phone_1' => $request->full_phone1,
            'phone_2' => $request->full_phone2 ?? null,
            'active' => $request->status,
        ]);

        return ArrayResp(
            Message: "Store Added Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function edit(Request $request)
    {

        $store = Store::find($request->id);

        $store->update([
            'name' => $request->name,
            'location' => $request->location,
            'address' => $request->address,
            'coordinates' => $request->coordinates,
            'key_name' => $request->key_name,
            'support_name' => $request->support_name ?? null,
            'email_1' => $request->email_1,
            'email_2' => $request->email_2 ?? null,
            'phone_1' => $request->full_phone1,
            'phone_2' => $request->full_phone2 ?? null,
            'active' => $request->status,
        ]);

        return ArrayResp(
            Message: "Store updated Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function delete($id)
    {
        $record = Store::find($id);
        $record->delete();

        return ArrayResp(
            Message: "Store Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function offer_list()
    {
        $PageData = [
            "Title" => "Store Offers",
            "PageName" => "OfferListView",
            "Crumbs" => [
                "Store Offers",
                "List",
            ],
            "PageTilte" => "Store Offers"
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


    public function offer_form(Request $request, $id = NULL)
    {
        $readonly = $request->readonly;
        $duplicate = $request->duplicate;

        if (Auth::user()->role_id > 2) {
            $branches = Store::where('stores.id', Auth::user()->branch)->get();
        } else {
            $branches = Store::get();
        }

        if ($id) {
            $Offer = StoreOffer::select(
                'store_offers.id',
                'store_offers.name',
                'store_offers.comments',
                'store_offers.branch_id',
                'store_offers.slug',
                'store_offers.min_inv_amt',
                'store_offers.max_inv_amt',
                'store_offers.points',
                'store_offers.discount',
                'store_offers.type',
                'store_offers.usage_limit',
                'store_offers.expiry_start',
                'store_offers.expiry_end',
                'store_offers.offer_code',
                'stores.name AS branch_name',
                'store_offers.active',

            )->leftJoin('stores', 'stores.id', 'store_offers.branch_id')->find($id);

            // print_r($Offer);
            //     exit();
            $View = view("2_AdminPanel.3_Components.1_Pages.OfferListView.AddDataForm", compact('Offer', 'readonly', 'branches', 'duplicate'))->render();
        } else {
            $View = view("2_AdminPanel.3_Components.1_Pages.OfferListView.AddDataForm", compact('branches'))->render();
        }


        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_offer()
    {
        $now = Carbon::now();

        StoreOffer::where('expiry_end', '<', $now)
            ->where('active', 1)
            ->update(['active' => 0]);

        $query = StoreOffer::select(
            'store_offers.id',
            'store_offers.name',
            'store_offers.comments',
            'store_offers.branch_id',
            'store_offers.offer_code',
            'store_offers.slug',
            'store_offers.min_inv_amt',
            'store_offers.max_inv_amt',
            'store_offers.points',
            'store_offers.discount',
            'store_offers.type',
            'store_offers.usage_limit',
            'store_offers.expiry_start',
            'store_offers.expiry_end',
            'stores.name AS branch_name',
            'store_offers.active',

        )->leftJoin('stores', 'stores.id', 'store_offers.branch_id')->orderBy('store_offers.expiry_start', 'DESC');

        if (Auth::user()->role_id > 2) {
            $stores_offers = $query->where('store_offers.branch_id', Auth::user()->branch)->get();
        } else {
            $stores_offers = $query->get();
        }

        return ArrayResp(
            Data: $stores_offers,
            Message: "Offers fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function add_offer(Request $request)
    {
        foreach ($request->input('branch_id') as $branchId) {

            $offer = StoreOffer::create([
                'name' => $request->name,
                'comments' => $request->comment,
                'branch_id' => $branchId,
                'slug' => $request->slug,
                'min_inv_amt' => $request->min_amount,
                'max_inv_amt' => $request->max_amount,
                'points' => $request->points,
                'discount' => $request->discount,
                'type' => $request->type,
                'usage_limit' => $request->usage_limit,
                'expiry_start' => $request->expiry_start,
                'expiry_end' => $request->expiry_ends,
                'offer_code' => generateUniqueRandomCode(6),
                'active' => $request->status
            ]);
        }

        return ArrayResp(
            Message: "Offer Added Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function edit_offer(Request $request)
    {

        $offer = StoreOffer::find($request->id);

        $offer->update([
            'name' => $request->name,
            'comments' => $request->comment,
            'branch_id' => $request->branch_id,
            'slug' => $request->slug,
            'min_inv_amt' => $request->min_amount,
            'max_inv_amt' => $request->max_amount,
            'points' => $request->points,
            'discount' => $request->discount,
            'type' => $request->type,
            'usage_limit' => $request->usage_limit,
            'expiry_start' => $request->expiry_start,
            'expiry_end' => $request->expiry_ends,
            'active' => $request->status
        ]);

        return ArrayResp(
            Message: "Offer updated Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function delete_offer($id)
    {
        $record = StoreOffer::find($id);
        $record->delete();

        return ArrayResp(
            Message: "Offer Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function export()
    {
        return Excel::download(new StoreExport, 'stores.xlsx');
    }

    public function offer_export()
    {
        return Excel::download(new StoreOfferExport, 'storeoffer.xlsx');
    }
}
