<?php

namespace App\Http\Controllers\Api;

use App\Models\Store;
use App\Models\StoreOffer;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;

class StoreController extends Controller
{
    public function fetch_store()
    {

        $stores = Store::get();

        return ArrayResp(
            Data: $stores,
            Message: "Stores fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function store_info($id)
    {

        $store_info = Store::find($id);

        return ArrayResp(
            Data: $store_info,
            Message: "Store Info Fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function change_branch($branch_id)
    {
        $user = Auth::user();

        $user->update([
            'branch' => $branch_id,
        ]);

        $store = Store::with("store_offers")
        ->with('latest_loyality_offer')
        ->where('id', $branch_id)
        ->first();

        if(!$store) {
            return ArrayBadResp(
                Data: [],
                Message: "Store not found!",
                Misc: [],
                RespCode: 404,
            );
        }

        $store->loyality_offer = $store->latest_loyality_offer;
        unset($store->latest_loyality_offer);

        $points_required = $store->loyality_offer['points_required'] - (Auth::user()->wallet_balance ?? 0);
        
        $store->offer_eligibility = [
            'status' => (Auth::user()->wallet_balance >= $store->loyality_offer['points_required']) ? true : false,
            'points_required' => ($points_required < 0) ? 0 : $points_required,
        ];

        return ArrayResp(
            Data: $store,
            Message: "Store details fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_offer($id)
    {

        $stores_offers = StoreOffer::select(
            'store_offers.id',
            'store_offers.name',
            'store_offers.comments',
            'store_offers.branch_id',
            'store_offers.offer_code',
            'store_offers.slug',
            'stores.name AS branch_name',
            'store_offers.min_inv_amt',
            'store_offers.max_inv_amt',
            'store_offers.points',
            'store_offers.discount',
            'store_offers.type',
            'store_offers.usage_limit',
            'store_offers.expiry_start',
            'store_offers.expiry_end',
            'store_offers.active',

        )->leftJoin('stores', 'stores.id', 'store_offers.branch_id')->orderBy('store_offers.expiry_start', 'DESC')->where('store_offers.branch_id', $id)->where('store_offers.active', 1)->get();

        return ArrayResp(
            Data: $stores_offers,
            Message: "Offers fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_alloffer()
    {
        $offers = StoreOffer::select(
            'store_offers.id',
            'store_offers.name',
            'store_offers.comments',
            'store_offers.branch_id',
            'store_offers.offer_code',
            'store_offers.slug',
            'stores.name AS branch_name',
            'store_offers.min_inv_amt',
            'store_offers.max_inv_amt',
            'store_offers.points',
            'store_offers.discount',
            'store_offers.type',
            'store_offers.usage_limit',
            'store_offers.expiry_start',
            'store_offers.expiry_end',
            'store_offers.active',

        )->leftJoin('stores', 'stores.id', 'store_offers.branch_id')->orderBy('store_offers.expiry_start', 'DESC')->where('store_offers.active', 1)->get();

        return ArrayResp(
            Data: $offers,
            Message: "All Offers fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }
    public function offer_info($id, $offer_id)
    {

        $stores_offers = StoreOffer::select(
            'store_offers.id',
            'store_offers.name',
            'store_offers.comments',
            'store_offers.branch_id',
            'store_offers.offer_code',
            'store_offers.slug',
            'stores.name AS branch_name',
            'store_offers.min_inv_amt',
            'store_offers.max_inv_amt',
            'store_offers.points',
            'store_offers.discount',
            'store_offers.type',
            'store_offers.usage_limit',
            'store_offers.expiry_start',
            'store_offers.expiry_end',
            'store_offers.active',

        )->leftJoin('stores', 'stores.id', 'store_offers.branch_id')->orderBy('store_offers.expiry_start', 'DESC')->where('store_offers.branch_id', $id)->find($offer_id);

        return ArrayResp(
            Data: $stores_offers,
            Message: "Offer Info Fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }
}
