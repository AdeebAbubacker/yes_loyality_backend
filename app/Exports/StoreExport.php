<?php

namespace App\Exports;

use App\Models\Store;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Illuminate\Support\Facades\DB;

class StoreExport implements FromCollection, WithHeadings, WithStyles, WithColumnWidths
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $users =  Store::select(
            'stores.name',
            'stores.address',
            'stores.location',
            'stores.key_name',
            'stores.email_1',
            'stores.phone_1',
            'stores.support_name',
            'stores.email_2',
            'stores.phone_2',
            DB::raw("CASE stores.active WHEN 1 THEN 'Active' ELSE 'Inactive' END"),
        )->get();

        return $users;
    }

    public function headings(): array
    {
        return [
            'Store Name',
            'Address',
            'Location',
            'Key Name',
            'Key Email',
            'Key Phone',
            'Support Name',
            'Support Email',
            'Support Phone',
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
            'A' => 25,
            'B' => 35,
            'C' => 15,
            'D' => 20,
            'E' => 25,
            'F' => 15,
            'G' => 15,
            'H' => 25,
            'I' => 15,
        ];
    }
}
