<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Illuminate\Support\Facades\DB;


class UsersExport implements FromCollection, WithHeadings, WithStyles, WithColumnWidths
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $users =  User::select(
            'users.customer_id',
            'users.name',
            'users.email',
            'users.phone',
            DB::raw("CASE users.role_id WHEN 1 THEN 'Super Admin' WHEN 2 THEN 'Admin' WHEN 3 THEN 'Branch Manager' WHEN 4 THEN 'Cashier' ELSE 'User' END"),
            'stores.name AS branch',
            'users.wallet_total',
            'users.wallet_used',
            'users.wallet_balance',
            DB::raw("CASE users.active WHEN 1 THEN 'Active' ELSE 'Inactive' END"),
        )->leftJoin('stores', 'stores.id', 'users.branch')
            ->where('users.role_id','!=',1)
            ->get();

        return $users;
    }

    public function headings(): array
    {
        return [
            'Customer Id',
            'Name',
            'Email',
            'Phone',
            'Role',
            'Branch',
            'Wallet total',
            'Wallet used',
            'Wallet balance',
            'Status'
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
            'A' => 10,
            'B' => 20,
            'C' => 30,
            'D' => 15,
            'E' => 18,
            'F' => 25,
            'G' => 10,
            'H' => 11,
            'I' => 13,
        ];
    }

}
