<?php

namespace App\Http\Controllers\Admin;

use App\Models\AppSetting;
use Illuminate\Http\Request;
use GuzzleHttp\Promise\Create;
use App\Http\Controllers\Controller;
use App\Models\Store;
use Illuminate\Support\Facades\Auth;

class MerchantController extends Controller
{
    public function profile()
    {
        $count = AppSetting::count();
        if ($count == 0) {
            $no_merchants = true;

            return view('2_AdminPanel.2_Pages.MerchantProfile.profile', compact('no_merchants'));
        } else {
            $no_merchants = false;
            $merchant_info = AppSetting::find('hq_info');
            $merchant_info = $merchant_info->value;
            $currency = AppSetting::find('currency');

            $merchant_info = json_decode($merchant_info, true);
            return view('2_AdminPanel.2_Pages.MerchantProfile.profile', compact('no_merchants', 'merchant_info', 'currency'));
        }
    }

    public function form($id = NULL)
    {
        if ($id == 'edit') {
            $merchant_info = AppSetting::find('hq_info');
            $merchant_info = $merchant_info->value;
            $currency = AppSetting::find('currency');

            $merchant_info = json_decode($merchant_info, true);
            $View = view("2_AdminPanel.3_Components.1_Pages.EditMerchant.AddDataForm", compact('merchant_info', 'currency'))->render();
        } else {
            $View = view("2_AdminPanel.3_Components.1_Pages.EditMerchant.AddDataForm")->render();
        }



        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function add(Request $request)
    {
        $app_name = AppSetting::create([
            'name' => 'app_name',
            'value' => $request->name,
        ]);

        $contact_mail = AppSetting::create([
            'name' => 'contact_mail',
            'value' => $request->email_1,
        ]);

        $currency = AppSetting::create([
            'name' => 'currency',
            'value' => $request->currency,
        ]);

        $formData = $request->all();

        $data = [
            'name' => $formData['name'],
            'address' => $formData['address'],
            'location' => $formData['location'],
            'coordinates' => $formData['coordinates'],
            'name_1' => $formData['name_1'],
            'phone_1' => $formData['full_phone1'],
            'email_1' => $formData['email_1'],
            'name_2' => $formData['name_2'],
            'phone_2' => $formData['full_phone2'],
            'email_2' => $formData['email_2'],
        ];
        $json = json_encode($data);
        $hq_info =  AppSetting::create([
            'name' => 'hq_info',
            'value' => $json,
        ]);

        return ArrayResp(
            Message: "Merchant AAdded Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function edit(Request $request)
    {
        $app_name = AppSetting::find('app_name');
        $app_name->update([
            'value' => $request->name,
        ]);
        $contact_mail = AppSetting::find('contact_mail');
        $contact_mail->update([
            'value' => $request->email_1,
        ]);

        $currency = AppSetting::find('currency');
        $currency->update([
            'value' => $request->currency,
        ]);

        $hq_info = AppSetting::find('hq_info');
        $formData = $request->all();

        $data = [
            'name' => $formData['name'],
            'address' => $formData['address'],
            'location' => $formData['location'],
            'coordinates' => $formData['coordinates'],
            'name_1' => $formData['name_1'],
            'phone_1' => $formData['full_phone1'],
            'email_1' => $formData['email_1'],
            'name_2' => $formData['name_2'],
            'phone_2' => $formData['full_phone2'],
            'email_2' => $formData['email_2'],
        ];
        $json = json_encode($data);
        $hq_info->update([
            'value' => $json,
        ]);

        return ArrayResp(
            Message: "Merchant Detail Edited Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function delete()
    {
        AppSetting::truncate();
        return ArrayResp(
            Message: "Merchant Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function store_profile()
    {
        $merchant_name = AppSetting::find('app_name');
        $merchant_currency = AppSetting::find('currency');
        $store_id = Auth::user()->branch;
        $store_detail = Store::find($store_id);
        return view('2_AdminPanel.2_Pages.StoreProfile.profile', compact('store_detail', 'merchant_name', 'merchant_currency'));
    }


    public function fetch_currency()
    {
        $currency = AppSetting::find('currency');
        return ArrayResp(
            Data: $currency,
            Message: "Merchant Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }
}
