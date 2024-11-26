@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    Loyalty Management 
@endsection



@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Loyalty Management 
        @endslot
        @slot('title')
            Projects
        @endslot
    @endcomponent

    <div class="row project-wrapper">
        <div class="col-xxl-12">
            <form id="loyality-form" action="{{ route('AddLoyalityTransaction') }}" method="POST"
                enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-4" id="SelectSection">
                        <div class="card">
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="store_name" class="form-label">Store</label>
                                    <select class="form-select" id="store_name" name="store_name" data-choices>
                                        <option value="">Select Store</option>
                                        @foreach ($stores as $store)
                                            <option value="{{ $store->id }}" {{ $hide_dropdown ?? null }}
                                                @if (Auth::user()->branch == $store->id) {{ 'selected' }} @endif>
                                                {{ $store->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="mb-3" id="cashier_select_container">
                                    <label for="cashier_name" class="form-label">Cashier</label>
                                    <select class="form-select" id="cashier_name" name="cashier_name" data-choices>
                                        <option value="">Select Cashier</option>
                                        @foreach ($cashiers as $cashier)
                                            <option value="{{ $cashier->id }}"
                                                @if (in_array(Auth::user()->role_id, [3, 4])) @if (Auth::user()->id == $cashier->id) 
                                                {{ 'selected' }} @endif
                                                @endif>
                                                {{ $cashier->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User</label>
                                    <select class="form-select" id="user_name" name="user_name">
                                        <option value="">Select User</option>
                                        @foreach ($users as $user)
                                            <option value="{{ $user->customer_id }}">{{ $user->customer_id }} -
                                                {{ formatPhone($user->phone) ?? $user->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3" id="user_info">

                                </div>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->
                        <div class="card" id="BreakageCost" hidden>
                            <!-- end card body -->
                            <div class="card-body">
                                <div>
                                    <h6 class="form-label mb-1">Breakage Cost</h6>
                                    <hr>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">Breakage</th>
                                                <th scope="col">Details</th>
                                                <th scope="col">Cost</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Invoice Cost</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                            </tr>
                                            <tr>
                                                <td>Added Offer</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                            </tr>
                                            <tr>
                                                <td>Points</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                    </div>

                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="row g-2 justify-content-left">
                                    <div class="col-sm-auto">
                                        <button type="button" class="btn btn-primary add-btn" id="AddDataModelToggle"><i
                                                class="ri-add-line align-bottom me-1"></i>Add New User</button>
                                    </div>
                                    <div class="col-sm-auto">
                                        <button type="button" class="btn btn-success add-btn" id="RefreshBtn"><i
                                                class="bx bx-refresh align-center me-1"></i> Refresh</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Invoice Details</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 mb-0" id="Alert-section">
                                        <!-- Warning Alert -->
                                        <div class="alert alert-warning alert-border-left alert-dismissible fade show material-shadow"
                                            role="alert">
                                            <i class="ri-alert-line me-3 align-middle"></i> <strong>Warning</strong> -
                                            Select a user first
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="invoice_no" class="form-label">Invoice Number</label>
                                            <input type="number" class="form-control" id="invoice_no" name="invoice_no"
                                                placeholder="Enter Invoice Number" value="" disabled />
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="invoice_cost" class="form-label">Invoice Amount</label>
                                            <input type="number" class="form-control" id="invoice_cost" name="invoice_cost"
                                                placeholder="Enter Invoice Amount" value="" disabled />
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <input type="number" id="offer_id"name="offer" value="" hidden />
                                    <div class="col-12 mb-1" id="offer-section" hidden>
                                        <label for="final_cost" class="form-label">Offers</label>

                                        <!-- Vertical alignment (align-items-end) -->
                                        <div class="row align-items-end royalty-offer-wrap" id="inner-offer">

                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-6" id="Points-Utilized" hidden>
                                        <div class="mb-3">
                                            <label for="point_utilized" class="form-label">Points Utilized</label>
                                            <input type="text" class="form-control" id="point_utilized"
                                                name="point_utilized" placeholder="Points Utilized" value="0"
                                                style="border: 3px solid #c0513a;" disabled />
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-6" id="Points-Acquired">
                                        <div class="mb-3">
                                            <label for="point_acquired" class="form-label">Points Acquired</label>
                                            <input type="text" class="form-control" id="point_acquired"
                                                name="point_acquired" placeholder="Points Acquired" value="0"
                                                style="border: 3px solid #04AA6D;" disabled />
                                        </div>
                                    </div>
                                    <!--end col-->
                                    {{-- <div class="col-4">
                                <div class="mb-3">
                                    <label for="total_points" class="form-label">Total Points</label>
                                    <input type="text" class="form-control" id="total_points" name="total_points"
                                        placeholder="Points Acquired" value="" readonly />
                                </div>
                            </div> --}}


                                    <!--end col-->
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="balance_points" class="form-label">Balance Points</label>
                                            <input type="text" class="form-control" id="balance_points"
                                                name="balance_points" placeholder="Balance Points" value="0"
                                                disabled />
                                            <small class="form-text text-muted">Applied After Transaction</small>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="cost_reduced" class="form-label">Discount Applied</label>
                                            <input type="text" class="form-control" id="cost_reduced"
                                                name="cost_reduced" placeholder="Final Cost" value="0" disabled />
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="final_cost" class="form-label">Final Invoice Value</label>
                                            <input type="text" class="form-control" id="final_cost" name="final_cost"
                                                placeholder="Final Cost" value="0" disabled />
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-12">
                                        <div class="text-end">
                                            <button type="submit" id="SubmitBtn" class="btn btn-success w-sm"
                                                hidden>Submit</button>
                                            {{-- <a href="{{ route('TransactionListView') }}" class="btn btn-danger w-sm">Back</a> --}}
                                        </div>
                                    </div>
                                </div>
                                <!--end row-->
                            </div>
                        </div>
                        <!-- end card -->
                        <div class="card" id="PointRules" hidden>
                            <!-- end card body -->
                            <div class="card-body">
                                <div>
                                    <h6 class="form-label mb-1">Points Breakage </h6>
                                    <hr>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">Minimum Amount</th>
                                                <th scope="col">Points</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($rules as $rule)
                                                <tr>
                                                    <td>{{ $rule->min_amt }}</td>
                                                    <td>{{ $rule->point_received }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end col -->

                </div>
                <!-- end row -->
            </form>
        </div>
    </div>
@endsection

@section('script')
@endsection
