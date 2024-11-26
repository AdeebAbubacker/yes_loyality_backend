<?php

namespace App\Exports;

use App\Models\UserTransaction;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class TransactionExport implements FromCollection, WithHeadings, WithStyles, WithColumnWidths
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {   
        $transactions =   UserTransaction::select([
            'users.customer_id  AS user_customer_id',
            'users.name AS username',
            'stores.name AS storename',
            'cashier.name AS cashiername',
            'user_transactions.invoice_no',
            'user_transactions.invoice_amt',
            'user_transactions.coin_type',
            'user_transactions.coins',
            'user_transactions.final_amt',
        ])->leftJoin('users', 'users.id', 'user_transactions.user_id')
            ->leftJoin('stores', 'stores.id', 'user_transactions.store_id')
            ->leftJoin('users AS cashier', 'cashier.id', 'user_transactions.cashier_id')
            ->get();

        return $transactions;
    }

    public function headings(): array
    {
        return [
            'Customer Id',
            'Customer Name',
            'Store Name',
            'Cashier Name',
            'Invoice Number',
            'Invoice Amount',
            'Point Type',
            'Points',
            'Final Cost',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1    => ['font' => ['bold' => true]],
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 12,
            'B' => 20,
            'C' => 30,
            'D' => 15,
            'E' => 18,
            'F' => 15,
            'G' => 10,
            'H' => 11,
            'I' => 13,
        ];
    }
}
