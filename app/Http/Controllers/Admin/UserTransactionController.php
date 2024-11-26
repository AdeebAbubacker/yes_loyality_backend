<?php

namespace App\Http\Controllers\Admin;

use App\Exports\TransactionExport;
use App\Models\User;
use App\Models\Store;
use App\Models\StoreOffer;
use App\Models\LoyaltyRule;
use Illuminate\Http\Request;
use App\Models\LoyalityOffer;
use App\Models\UserTransaction;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;


class UserTransactionController extends Controller
{
    public function transaction_list()
    {
        $PageData = [
            "Title" => "Transaction",
            "PageName" => "TransactionListView",
            "Crumbs" => [
                "Transactions",
                "List",
            ],
            "PageTilte" => "Transactions"
        ];

        $Buttons = [
            [
                "type" => "link",
                "link" => "/admin/transaction/form",
                "colour" => "success",
                "class" => "add-btn",
                "id" => "",
                "text" => '<i class="ri-file-list-3-line"></i> Loyalty Mgmt',
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

    public function transaction_form(Request $request, $id = NULL)
    {
        $readonly = $request->readonly;
        $users = User::get();
        $stores = Store::get();

        if ($id) {
            $Transaction = UserTransaction::select([
                'user_transactions.id',
                'user_transactions.user_id',
                'users.id AS user_pid',
                'users.name AS username',
                'users.customer_id AS customer_id',
                'users.phone AS phone',
                'user_transactions.store_id',
                'stores.name AS storename',
                'user_transactions.cashier_id',
                'cashier.name AS cashiername',
                'user_transactions.invoice_no',
                'user_transactions.invoice_amt',
                'user_transactions.coins',
                'user_transactions.coin_type',
                'user_transactions.final_amt',
                'user_transactions.created_at',
            ])->leftJoin('users', 'users.id', 'user_transactions.user_id')
                ->leftJoin('stores', 'stores.id', 'user_transactions.store_id')
                ->leftJoin('users AS cashier', 'cashier.id', 'user_transactions.cashier_id')->find($id);

            $View = view("2_AdminPanel.3_Components.1_Pages.TransactionListView.AddDataForm", compact('Transaction', 'readonly', 'users', 'stores'))->render();
        } else {
            $View = view("2_AdminPanel.3_Components.1_Pages.TransactionListView.AddDataForm", compact('users', 'stores'))->render();
        }


        return ArrayResp(
            Data: $View,
            Message: "Model Rendered Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_cashiers(Request $request)
    {

        $cashiers = User::where('branch', $request->branch_id)->where('active', 1)->get();

        return ArrayResp(
            Data: $cashiers,
            Message: "Cashiers fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function fetch_transactions(Request $request)
    {

        $queryParams = $request->query();

        $query = UserTransaction::select([
            'user_transactions.id',
            'user_transactions.user_id',
            'users.id AS user_pid',
            'users.customer_id  AS user_customer_id',
            'users.name AS username',
            'user_transactions.store_id',
            'stores.name AS storename',
            'user_transactions.cashier_id',
            'cashier.name AS cashiername',
            'user_transactions.invoice_no',
            'user_transactions.invoice_amt',
            'user_transactions.coin_type',
            'user_transactions.coins',
            'user_transactions.final_amt',
            'user_transactions.created_at',
        ])->leftJoin('users', 'users.id', 'user_transactions.user_id')
            ->leftJoin('stores', 'stores.id', 'user_transactions.store_id')
            ->leftJoin('users AS cashier', 'cashier.id', 'user_transactions.cashier_id')
            ->orderBy('created_at', 'DESC');

        foreach ($queryParams as $key => $value) {

            if ($value != null) {
                // Apply 'LIKE' condition if value is not empty
                if ($key == 'created_at') {
                    $query->where('user_transactions.' . $key, 'LIKE', '%' . $value . '%');
                } else {
                    $query->where('users.' . $key, 'LIKE', '%' . $value . '%');
                }
            }
        }

        if (Auth::user()->role_id > 2) {
            $transaction = $query->where('user_transactions.store_id', Auth::user()->branch)->get();
        } else {
            $transaction = $query->get();
        }

        return ArrayResp(
            Data: $transaction,
            Message: "Transactions fetched Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function add(Request $request)
    {

        $transaction = UserTransaction::create([
            'user_id' => $request->user_id,
            'store_id' => $request->store_name,
            'cashier_id' => $request->cashier_name,
            'invoice_no' => $request->invoice_no,
            'invoice_amt' => $request->invoice_amt,
            'coins' => $request->coins,
            'final_amt' => $request->final_amt,

        ]);

        return ArrayResp(
            Message: "Transaction Added Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function edit(Request $request)
    {

        $transaction = UserTransaction::find($request->id);

        $transaction->update([
            'user_id' => $request->user_id,
            'store_id' => $request->store_name,
            'cashier_id' => $request->cashier_name,
            'invoice_no' => $request->invoice_no,
            'invoice_amt' => $request->invoice_amt,
            'coins' => $request->coins,
            'coin_type' => $request->coin_type,
            'final_amt' => $request->final_amt,
        ]);

        return ArrayResp(
            Message: "Transaction updated Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function delete($id)
    {
        $record = UserTransaction::find($id);
        $record->delete();

        return ArrayResp(
            Message: "Store Deleted Succesfully!",
            NeedCount: FALSE,
            Misc: []
        );
    }

    public function form_page()
    {
        $rules = LoyaltyRule::orderBy('min_amt', 'asc')->get();
        // $cashiers = User::where("role_id", "<", 5)
        //     ->when(in_array(Auth::user()->role_id, [3, 4]), function ($query) {
        //         return $query->where("id", Auth::user()->id);
        //     })->get();
        if (in_array(Auth::user()->role_id, [4])) {
            $cashiers = User::where('id', Auth::user()->id)
                ->where('role_id', '!=', 5)->where('branch', Auth::user()->branch)->where('active', 1)->get();
        } else {
            $cashiers = User::where('role_id', '>', Auth::user()->role_id)
                ->where('role_id', '!=', 5)->where('branch', Auth::user()->branch)->where('active', 1)->get();
        }

        // print_r(Auth::user()->branch); exit;

        // $stores = Store::when(in_array(Auth::user()->role_id, [3, 4]), function ($query) {
        //     return $query->where("id", Auth::user()->branch);
        // })->get();

        if (in_array(Auth::user()->role_id, [1, 2])) {
            $stores = Store::where('active', 1)->get();
        } else {
            $stores = Store::where('id', Auth::user()->branch)->where('active', 1)->get();
        }

        if (Auth::user()->branch != null) {
            $users = User::orderByRaw("`branch` != " . Auth::user()->branch)->where('users.role_id', 5)->where('active', 1)->get();
        } else {
            $users = User::where('users.role_id', 5)->where('active', 1)->get();
        }

        return view("2_AdminPanel.2_Pages.Transaction.transaction", compact('users', 'cashiers', 'stores', 'rules'));
    }

    public function export()
    {
        return Excel::download(new TransactionExport, 'transaction.xlsx');
    }
}
