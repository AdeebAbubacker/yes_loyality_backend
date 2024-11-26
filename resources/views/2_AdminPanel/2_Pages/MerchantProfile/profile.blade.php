@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    Profile
@endsection



@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Company Profile
        @endslot
        @slot('title')
            Profile
        @endslot
    @endcomponent

    @if ($no_merchants)
        <div class="row g-4 mb-3">
            <div class="col-sm-12">
                @if (Auth::user()->role_id == 1)
                    <div>
                        <a href="#" class="btn btn-success AddRecord"><i class="ri-add-line align-bottom me-1"></i> Add
                            MERCHANT</a>
                    </div>
                @else
                    {{-- <div class="d-flex justify-content-center">
                        <h1>No Details Found</h1>
                    </div> --}}
                @endif
            </div>
        </div>
    @else
        <div class="row">
            <div class="col-xxl-12">
                <div class="card">
                    <div class="card-body p-4">
                        <div>

                            <div class="mt-0">
                                <h5 class="mb-1">{{ $merchant_info['name'] }}</h5>
                                <hr>
                            </div>
                            <div class="table-responsive">
                                <table class="table mb-0 table-borderless">
                                    <tbody>
                                        <tr>
                                            <th><span class="fw-medium">Merchant Name</span></th>
                                            <td>{{ $merchant_info['name'] }}</td>
                                        </tr>
                                        <tr>
                                            <th><span class="fw-medium">Merchant Address</span></th>
                                            <td>{{ $merchant_info['address'] }}</td>
                                        </tr>
                                        <tr>

                                            <th><span class="fw-medium">Location</span></th>
                                            <td>{{ $merchant_info['location'] }}</td>
                                        </tr>
                                        <tr>
                                            <th><span class="fw-medium">Currency</span></th>
                                            <td>{{ $currency->value }}</td>
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
                                            <td>{{ $merchant_info['name_1'] }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><span class="fw-medium">Phone</span></th>
                                            <td>{{ formatPhone($merchant_info['phone_1']) }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><span class="fw-medium">Email</span></th>
                                            <td>{{ $merchant_info['email_1'] }}</td>
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
                                            <td>{{ $merchant_info['name_2'] }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><span class="fw-medium">Phone</span></th>
                                            <td>{{ formatPhone($merchant_info['phone_2']) }}</td>
                                        </tr>
                                        <tr>
                                            <th><span class="fw-medium">Email</span></th>
                                            <td>{{ $merchant_info['email_2'] }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--end card-body-->
                    <div class="card-body p-4 border-top border-top-dashed">
                        <div class="text-end">
                            <button type="submit" class="btn btn-primary EditRecord"><i
                                    class="ri-edit-box-line align-bottom"></i>
                                Edit Profile</button>
                            @if (Auth::user()->role_id == 1)
                                <button type="button" class="btn btn-danger DeleteRecord"><i
                                        class="ri-edit-box-line align-bottom"></i>
                                    Delete Profile</button>
                            @endif
                        </div>
                    </div>
                    <!--end card-body-->
                </div>
                <!--end card-->
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    @endif


@endsection
