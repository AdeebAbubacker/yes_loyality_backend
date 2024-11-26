@php
    if(Auth::user()->role_id <= 2):
        $value = 3;
    elseif(Auth::user()->role_id < 4):
        $value = 4;
    else:
        $value = 6;
    endif;
    @endphp

@extends('2_AdminPanel.1_Layouts.1_MainLayout')
@section('title') Dashboard @endsection
@section('content')

    @component('components.breadcrumb')
        @slot('li_1') Dashboard @endslot
        @slot('title') Projects @endslot
    @endcomponent
    
    <div class="row project-wrapper">
        <div class="col-xxl-8">
            <div class="row">
                <div class="col-xl-4">
                    <div class="card card-animate">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span
                                        class="avatar-title bg-soft-primary text-primary rounded-2 fs-2">
                                        <i data-feather="smile" class="text-primary"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 overflow-hidden ms-3">
                                    <p class="text-uppercase fw-medium text-muted text-truncate mb-3">
                                        Total Customers</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class="counter-value"
                                                data-target="{{ $total_customers }}">0</span></h4>
                                        {{-- <span class="badge badge-soft-danger fs-12"><i
                                                class="ri-arrow-down-s-line fs-13 align-middle me-1"></i>5.02
                                            %</span> --}}
                                    </div>
                                    {{-- <p class="text-muted text-truncate mb-0">Projects this month</p> --}}
                                </div>
                            </div>
                        </div><!-- end card body -->
                    </div>
                </div><!-- end col -->

                <div class="col-xl-4">
                    <div class="card card-animate">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span
                                        class="avatar-title bg-soft-warning text-warning rounded-2 fs-2">
                                        <i data-feather="credit-card" class="text-warning"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <p class="text-uppercase fw-medium text-muted mb-3">Total Transaction</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class="counter-value"
                                                data-target="{{ $total_transactions }}">0</span></h4>
                                        {{-- <span class="badge badge-soft-success fs-12"><i
                                                class="ri-arrow-up-s-line fs-13 align-middle me-1"></i>3.58
                                            %</span> --}}
                                    </div>
                                    {{-- <p class="text-muted mb-0">Leads this month</p> --}}
                                </div>
                            </div>
                        </div><!-- end card body -->
                    </div>
                </div><!-- end col -->

                <div class="col-xl-4">
                    <div class="card card-animate">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span class="avatar-title bg-soft-info text-info rounded-2 fs-2">
                                        <i data-feather="clock" class="text-info"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 overflow-hidden ms-3">
                                    <p class="text-uppercase fw-medium text-muted text-truncate mb-3">
                                        Total Points</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class="counter-value"
                                                data-target="{{ $total_points }}">0</span></h4>
                                        {{-- <span class="badge badge-soft-danger fs-12"><i
                                                class="ri-arrow-down-s-line fs-13 align-middle me-1"></i>10.35
                                            %</span> --}}
                                    </div>
                                    {{-- <p class="text-muted text-truncate mb-0">Work this month</p> --}}
                                </div>
                            </div>
                        </div><!-- end card body -->
                    </div>
                </div><!-- end col -->

                <div class="col-xl-4">
                    <div class="card card-animate">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span
                                        class="avatar-title bg-soft-primary text-primary rounded-2 fs-2">
                                        <i data-feather="home" class="text-primary"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <p class="text-uppercase fw-medium text-muted mb-3">Total Stores</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class="counter-value"
                                                data-target="{{ $total_branches }}">0</span></h4>
                                        {{-- <span class="badge badge-soft-success fs-12"><i
                                                class="ri-arrow-up-s-line fs-13 align-middle me-1"></i>3.58
                                            %</span> --}}
                                    </div>
                                    {{-- <p class="text-muted mb-0">Leads this month</p> --}}
                                </div>
                            </div>
                        </div><!-- end card body -->
                    </div>
                </div><!-- end col -->

                <div class="col-xl-4">
                    <div class="card card-animate">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span
                                        class="avatar-title bg-soft-warning text-warning rounded-2 fs-2">
                                        <i data-feather="user" class="text-warning"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <p class="text-uppercase fw-medium text-muted mb-3">Total Managers</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class="counter-value"
                                                data-target="{{ $total_managers }}">0</span></h4>
                                        {{-- <span class="badge badge-soft-success fs-12"><i
                                                class="ri-arrow-up-s-line fs-13 align-middle me-1"></i>3.58
                                            %</span> --}}
                                    </div>
                                    {{-- <p class="text-muted mb-0">Leads this month</p> --}}
                                </div>
                            </div>
                        </div><!-- end card body -->
                    </div>
                </div><!-- end col -->

                <div class="col-xl-4">
                    <div class="card card-animate">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span
                                        class="avatar-title bg-soft-info text-info rounded-2 fs-2">
                                        <i data-feather="user" class="text-info"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <p class="text-uppercase fw-medium text-muted mb-3">Total Cashiers</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class="counter-value"
                                                data-target="{{ $total_cashier }}">0</span></h4>
                                        {{-- <span class="badge badge-soft-success fs-12"><i
                                                class="ri-arrow-up-s-line fs-13 align-middle me-1"></i>3.58
                                            %</span> --}}
                                    </div>
                                    {{-- <p class="text-muted mb-0">Leads this month</p> --}}
                                </div>
                            </div>
                        </div><!-- end card body -->
                    </div>
                </div><!-- end col -->
            </div><!-- end row -->

            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header border-0 align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Take Actions Here</h4>
                            {{-- <div>
                                <button type="button" class="btn btn-soft-secondary btn-sm">
                                    ALL
                                </button>
                                <button type="button" class="btn btn-soft-secondary btn-sm">
                                    1M
                                </button>
                                <button type="button" class="btn btn-soft-secondary btn-sm">
                                    6M
                                </button>
                                <button type="button" class="btn btn-soft-primary btn-sm">
                                    1Y
                                </button>
                            </div> --}}
                        </div><!-- end card header -->

                        <div class="card-header p-0 border-0 bg-soft-light">
                            <div class="row g-0 text-center">
                                <div class="col-{{ $value }}">
                                    <div class="p-3 border border-dashed border-start-0">
                                        <div class="flex-shrink-0">
                                            <a href="{{ route('TransactionPage')}}" class="btn btn-soft-danger btn-sm material-shadow-none">Go to Loyalty Mgmt Page<i class="ri-arrow-right-line align-bottom"></i></a>
                                        </div>
                                        {{-- <p class="text-muted mb-0">Go to POS Page</p> --}}
                                    </div>
                                </div>
                                <!--end col-->
                                <div class="col-{{ $value }}">
                                    <div class="p-3 border border-dashed border-start-0">
                                        <div class="flex-shrink-0">
                                            <a href="{{ route('TransactionListView')}}" class="btn btn-soft-danger btn-sm material-shadow-none">Go to Transaction List<i class="ri-arrow-right-line align-bottom"></i></a>
                                        </div>
                                        {{-- <p class="text-muted mb-0">Go to Transaction List</p> --}}
                                    </div>
                                </div>
                                <!--end col-->
                                @if(Auth::user()->role_id <= 2)
                                <div class="col-{{ $value }}">
                                    <div class="p-3 border border-dashed border-start-0">
                                        <div class="flex-shrink-0">
                                            <a href="{{ route('StoreListView')}}" class="btn btn-soft-danger btn-sm material-shadow-none">Go to Store List<i class="ri-arrow-right-line align-bottom"></i></a>
                                        </div>
                                        {{-- <p class="text-muted mb-0">Go to Store List</p> --}}
                                    </div>
                                </div>
                                @endif
                                <!--end col-->
                                @if(Auth::user()->role_id < 4)
                                <div class="col-{{ $value }}">
                                    <div class="p-3 border border-dashed border-start-0 border-end-0">
                                        
                                        {{-- <p class="text-muted mb-0">Add New Users</p> --}}
                                        <div class="flex-shrink-0">
                                            <a href="{{ route('UserListView')}}" class="btn btn-soft-danger btn-sm material-shadow-none">Go to Users List<i class="ri-arrow-right-line align-bottom"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!--end col-->
                            </div>
                            @endif
                        </div><!-- end card header -->
                        <div class="card-body p-0 pb-2">
                            <div>
                                <div id="projects-overview-chart"
                                    data-colors='["--vz-primary", "--vz-warning", "--vz-success"]'
                                    dir="ltr" class="apex-charts"></div>
                            </div>
                        </div><!-- end card body -->
                    </div><!-- end card -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end col -->
    </div><!-- end row -->
@endsection

