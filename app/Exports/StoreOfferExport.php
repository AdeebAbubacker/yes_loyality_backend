<?php

namespace App\Exports;

use App\Models\StoreOffer;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Illuminate\Support\Facades\DB;

class StoreOfferExport implements FromCollection, WithHeadings, WithStyles, WithColumnWidths
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return StoreOffer::select(
            'store_offers.name',
            'store_offers.comments',
            'stores.name AS store_name',
            'store_offers.min_inv_amt',
            'store_offers.max_inv_amt',
            'store_offers.points',
            'store_offers.discount',
            'store_offers.type',
            'store_offers.expiry_start',
            'store_offers.expiry_end',
            DB::raw("CASE store_offers.active WHEN 1 THEN 'Active' ELSE 'Inactive' END"),
        )->leftJoin('stores', 'stores.id', 'store_offers.branch_id')
            ->get();
    }

    public function headings(): array
    {
        return [
            'Offer Name',
            'Description',
            'Store Name',
            'Minimum Amount',
            'Max Reduction',
            'Points Required',
            'Discount Value',
            'Discount Type',
            'Valid From',
            'Valid To',
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
            'A' => 20,
            'B' => 25,
            'C' => 20,
            'D' => 20,
            'E' => 20,
            'F' => 20,
            'G' => 20,
            'H' => 20,
            'I' => 20,
            'J' => 20,

        ];
    }
}
