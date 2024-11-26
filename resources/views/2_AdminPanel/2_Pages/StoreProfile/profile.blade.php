@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    Store Profile
@endsection



@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Store Profile
        @endslot
        @slot('title')
            Profile
        @endslot
    @endcomponent

    <div class="row">
        <div class="col-xxl-12">
            <div class="card">
                <div class="card-body p-4">
                    <div>

                        <div class="mt-0">
                            <h5 class="mb-1">{{ $store_detail->name ?? null }}</h5>
                            <p class="text-muted">Profile</p>
                        </div>
                        <div class="table-responsive">
                            <input id="store_id" value="{{ $store_detail->id ?? null }}" hidden />
                            <table class="table mb-0 table-borderless">
                                <tbody>
                                    <tr>
                                        <th><span class="fw-medium">Merchant Name</span></th>
                                        <td>{{ $merchant_name->value ?? null }}</td>
                                    </tr>
                                    <tr>
                                        <th><span class="fw-medium">Store Name</span></th>
                                        <td>{{ $store_detail->name ?? null }}</td>
                                    </tr>
                                    <tr>
                                        <th><span class="fw-medium">Store Address</span></th>
                                        <td>{{ $store_detail->address ?? null }}</td>
                                    </tr>
                                    <tr>

                                        <th><span class="fw-medium">Location</span></th>
                                        <td>{{ $store_detail->location ?? null }}</td>
                                    </tr>
                                    <tr>
                                        <th><span class="fw-medium">Currency</span></th>
                                        <td>{{ $merchant_currency->value }}</td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                        <div class="mt-0">
                            <hr>
                            <h6 class="mb-1">Key Contact</h6>
                            <hr>
                        </div>
                        <div class="table-responsive">
                            <table class="table mb-0 table-borderless">
                                <tbody>
                                    <tr>
                                        <th><span class="fw-medium">Name</span></th>
                                        <td>{{ $store_detail->key_name ?? null }}</td>
                                    </tr>
                                    <tr>
                                        <th><span class="fw-medium">Phone</span></th>
                                        <td>{{ formatPhone($store_detail->phone_1) ?? null }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="fw-medium">Email</span></th>
                                        <td>{{ $store_detail->email_1 ?? null }}</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="mt-0">
                            <hr>
                            <h6 class="mb-1">Support Contact</h6>
                            <hr>
                        </div>
                        <div class="table-responsive">
                            <table class="table mb-0 table-borderless">
                                <tbody>
                                    <tr>
                                        <th><span class="fw-medium">Name</span></th>
                                        <td>{{ $store_detail->support_name ?? null }}</td>
                                    </tr>
                                    <tr>
                                        <th><span class="fw-medium">Phone</span></th>
                                        <td>{{ formatPhone($store_detail->phone_2) ?? null }}</td>
                                    </tr>
                                    <tr>
                                        <th><span class="fw-medium">Email</span></th>
                                        <td>{{ $store_detail->email_2 ?? null }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--end card-body-->
                @if (Auth::user()->role_id == 3)
                    <div class="card-body p-4 border-top border-top-dashed">
                        <div class="text-end">

                            <button type="submit" class="btn btn-primary EditRecord"><i
                                    class="ri-edit-box-line align-bottom"></i>
                                Edit Profile</button>
                        </div>
                    </div>
                @endif
                <!--end card-body-->
            </div>
            <!--end card-->
        </div>
        <!--end col-->
    </div>
    <!--end row-->
@endsection
