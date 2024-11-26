@php
    $Edit = isset($Booking) ? 1 : 0;

    $bkng_id = $bkng_month = $bkng_year = $bkng_main_traveller = $bkng_agent_id = $bkng_total_amount = $bkng_message = $bkng_status = $bkng_cancelled = $bkng_cancellation_reason = $bkng_active = $trlr_id = $trlr_booking_id = $trlr_name = $trlr_email = $trlr_phone = $trlr_age = $trlr_gender = $trlr_address = $trlr_aadhaar = $trlr_same_gender = $trlr_window_seat = $trlr_active = "";

    $travellers = [[
            'id' => "",
            'booking_id' => "",
            'name' => "",
            'email' => "",
            'phone' => "",
            'age' => "",
            'gender' => "",
            'address' => "",
            'aadhaar' => "",
            'same_gender' => "",
            'window_seat' => "",
            'active' => "",
        ]];

    if ($Edit):
        $bkng_id = $Booking->id;
        $bkng_month = $Booking->month;
        $bkng_year = $Booking->year;
        $bkng_main_traveller = $Booking->main_traveller;
        $bkng_agent_id = $Booking->agent_id;
        $bkng_total_amount = $Booking->total_amount;
        $bkng_message = $Booking->message;
        $bkng_status = $Booking->status;
        $bkng_cancelled = $Booking->cancelled;
        $bkng_cancellation_reason = $Booking->cancellation_reason;
        $bkng_active = $Booking->active;

        $travellers = $Booking->travellers;
       
        $email = $travellers[0]['email'];
        $bkng_main_traveller = $travellers[0]['name'];
        $trlr_phone =$travellers[0]['phone'];
        $trlr_address =$travellers[0]['address'];


    endif;
    // print_r($travellers); exit;

@endphp


<link rel="stylesheet" href="https://giridharitours.com/1_WebFrontend/css/fontawesome-all.min.css">
<!-- booking-area-start -->
<div class="booking-area pt-50 pb-50">
    <div class="container">
        <div class="form-wrapper">
            <form method="POST" action="{{ Route('add_edit_booking', $bkng_id) }}" id="TravelBookingForm">
                @csrf
                <div class="row">
                    <h5>Personal Details</h5>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label for="main_traveller_1">Name <span>*</span></label>
                            <input type="text" class="form-control" value="{{ $bkng_main_traveller ?? "" }}" name="name"
                                id="main_traveller_1" onkeyup="updateTravelerName(this.value)">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label for="email">Email <span>*</span></label>
                            <input type="email" name="email" id="email" class="form-control"
                                value="{{ $email ?? "" }}">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label for="ph">Phone Number <span>*</span></label>
                            <input type="tel" name="phone" id="ph" class="form-control"
                            value="{{ $trlr_phone ?? "" }}">
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-6">
                        <div class="form-group">
                            <label for="addr">Address <span>*</span></label>
                            <textarea name="address" id="addr" cols="45" rows="3" maxlength="65525" class="form-control"> {{ $trlr_address }}</textarea>
                        </div>
                    </div>
                    <h5>Booking Details</h5>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label for="monthSelect">Month <span>*</span></label>
                            <div class="input-group date">
                                <select class="form-select" aria-label="Default select" name="month"
                                    id="monthSelect">
                                    <option value="1" {{ $bkng_month == "1" ? 'selected' : '' }}>January</option>
                                    <option value="2" {{ $bkng_month == "2" ? 'selected' : '' }}>February</option>
                                    <option value="3" {{ $bkng_month == "3" ? 'selected' : '' }}>March</option>
                                    <option value="4" {{ $bkng_month == "4" ? 'selected' : '' }}>April</option>
                                    <option value="5" {{ $bkng_month == "5" ? 'selected' : '' }}>May</option>
                                    <option value="6" {{ $bkng_month == "6" ? 'selected' : '' }}>June</option>
                                    <option value="7" {{ $bkng_month == "7" ? 'selected' : '' }}>July</option>
                                    <option value="8" {{ $bkng_month == "8" ? 'selected' : '' }}>August</option>
                                    <option value="9" {{ $bkng_month == "9" ? 'selected' : '' }}>September</option>
                                    <option value="10" {{ $bkng_month == "10" ? 'selected' : '' }}>October</option>
                                    <option value="11" {{ $bkng_month == "11" ? 'selected' : '' }}>November</option>
                                    <option value="12" {{ $bkng_month == "12" ? 'selected' : '' }}>December</option>
                                    
                                </select>
                                <span class="input-group-append">
                                    <span class="input-group-text d-block">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label for="yearInput">Year <span>*</span></label>
                            <input type="number" name="year" id="yearInput" class="form-control"
                                value="{{ $bkng_year ?? "" }}">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group mb-0">
                            <label for="agent">Agent ID<span></span></label>
                            <input type="number" name="agent_id" id="agent" class="form-control"
                                value="{{ $bkng_agent_id ?? "" }}">
                            <div class="details d-flex justify-content-between">
                                <span>Krishna</span>
                                <span>+91 9876543210</span>
                            </div>
                        </div>
                    </div>
                    <h5>Traveler Details</h5>
                    <div class="traveller_wrap" id="traveller_wrap">
                        @foreach ($travellers as $key => $traveller)
                            @php
                                $trlr_id = $traveller['id'];
                                $trlr_booking_id = $traveller['booking_id'];
                                $trlr_name = $traveller['name'];
                                $trlr_email = $traveller['email'];
                                $trlr_phone = $traveller['phone'];
                                $trlr_age = $traveller['age'];
                                $trlr_gender = $traveller['gender'];
                                $trlr_address = $traveller['address'];
                                $trlr_aadhaar = $traveller['aadhaar'];
                                $trlr_same_gender = $traveller['same_gender'];
                                $trlr_window_seat = $traveller['window_seat'];
                                $trlr_active = $traveller['active'];
                            @endphp
                            
                        <div class="row traveller_info_wrap{!! ($key) ? ' pt-4 border-top' : '' !!}" {!! (!$key) ? 'id="main_traveller_info"' : '' !!}>
                            <div class="col-lg-11 col-md-11">
                                <div class="row row-expand">
                                    <div class="hidden">
                                        <input class="form-control" type="hidden" name="traveller_id[]" value="{{ $trlr_id ?? 0 }}">
                                    </div>
                                    @if ($key)
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label for="traveller_name_{{ $key }}">Name <span>*</span></label>
                                            <input type="text" name="traveller_name[]"
                                                class="form-control" value="{{ $trlr_name ?? "" }}" id="traveller_name_{{ $key }}">
                                        </div>
                                    </div>

                                    @else
                                    
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label for="main_traveller">Name <span>*</span></label>
                                            <input type="text" name="traveller_name[]"
                                                class="form-control" value="{{ $trlr_name ?? "" }}" id="main_traveller"
                                                readonly>
                                        </div>
                                    </div>
                                        
                                    @endif
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label for="traveller_age">Age <span>*</span></label>
                                            <input type="number" name="traveller_age[]" id="traveller_age"
                                                class="form-control" value="{{ $trlr_age ?? "" }}" >
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label for="traveller_gender">Gender<span>*</span></label>
                                            <select class="form-select" aria-label="Default select" name="traveller_gender[]" id="traveller_gender">
                                                <option value="" {{ $trlr_gender == "" ? 'selected' : '' }}></option>
                                                <option value="m" {{ $trlr_gender == "m" ? 'selected' : '' }}>Male</option>
                                                <option value="f" {{ $trlr_gender == "f" ? 'selected' : '' }}>Female</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label for="traveller_aadhar">Aadhar Number<span>*</span></label>
                                            <input type="number" name="traveller_aadhaar[]"
                                                id="traveller_aadhar" class="form-control" value="{{ $trlr_aadhaar ?? "" }}">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label for="same_gender_pref">Prefer to be seated with the same
                                                gender</label>
                                            <select class="form-select" name="same_gender_pref[]"
                                                id="same_gender">
                                                <option value="" {{ $trlr_same_gender == "" ? 'selected' : '' }}></option>
                                                <option value="1"{{ $trlr_same_gender == "1" ? 'selected' : '' }}>Yes</option>
                                                <option value="2" {{ $trlr_same_gender == "2" ? 'selected' : '' }}>No</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label for="window_prefer">Prefer
                                                Window Side Seat</label>
                                            <select class="form-select" name="window_pref[]"
                                                id="window_prefer">
                                                <option selected {{ $trlr_window_seat == "" ? 'selected' : '' }}> </option>
                                                <option value="1"{{ $trlr_window_seat == "1" ? 'selected' : '' }}>Yes</option>
                                                <option value="2" {{ $trlr_window_seat == "2" ? 'selected' : '' }}>No</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-1 col-md-1">
                                <div class="add-remove-icon">
                                    <a href="#" class="add-section">
                                        <i class="fa fa-plus-circle add-section" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                <div class="col-lg-12 col-md-6 text-center">
                    <div class="hidden">
                        <input class="form-control" type="hidden" name="Id" value="{{ $bkng_id ?? "" }}">
                    </div>
                    <button type="submit" class="btn-lg mt-30 mb-20">Submit</button>
                </div>
            </form>
        </div>
    </div>
    <!-- tab-contet -->
</div>
<!-- booking-area-end -->


<style>
    #CommonModel .modal-dialog {
        max-width: 1200px;
    }

    .mt-30 {
        margin-top: 30px;
    }

    .mb-20 {
        margin-bottom: 20px;
    }

    .mb-40 {
        margin-bottom: 40px;
    }

    .pt-50 {
        padding-top: 50px;
    }

    .pb-50 {
        padding-bottom: 50px;
    }

    .btn-lg {
        background: #ff664e;
        color: #ffffff;
        font-weight: 700;
        display: inline-block;
        padding: 20px 74px;
        line-height: 1;
        font-size: 13px;
        text-transform: uppercase;
        border-radius: 50px;
        border: 2px solid transparent;
        letter-spacing: 2px;
    }

    .nav-button-list {
        justify-content: center;
    }

    .nav-button.active {
        background: #ff664e;
        border-color: #ff664e;
        color: #ffffff;
    }

    .nav-button-one {
        background: #fff;
        padding: 15px 30px;
        color: #686893;
        font-size: 14px;
        font-weight: 600;
        border: none;
        border: 1px solid #eceff8;
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
        text-transform: uppercase;
    }

    .nav-button-two {
        background: #fff;
        padding: 15px 30px;
        color: #686893;
        font-size: 14px;
        font-weight: 600;
        border: none;
        border: 1px solid #eceff8;
        border-top-right-radius: 30px;
        border-bottom-right-radius: 30px;
        text-transform: uppercase;
    }

    .input-group-append {
        cursor: pointer;
    }

    .b-id .btn-lg {
        padding: 15px 30px;
        border-radius: 40px;
        margin: 30px 0 0 0;
    }

    .form-wrapper h5 {
        color: #222;
        padding: 10px 15px;
        font-size: 18px;
        margin-bottom: 30px;
    }

    .form-wrapper h5:after {
        background-color: #ec6e39;
        bottom: -8px;
        height: 2px;
        width: 50px;
        position: relative;
        content: "";
        display: block;
    }

    .form-wrapper {
        padding: 20px;
    }

    .booking-form label {
        color: #222;
        padding-bottom: 7px;
    }

    .booking-form .form-group {
        margin-bottom: 20px;
    }

    .booking-form .form-group .form-control {
        height: 50px;
        background: #ffffff;
        padding: 0 10px;
        font-size: 14px;
        border: 1px solid #e3e3e3;
        outline: none;
        transition: 0.3s;
        border-radius: 0;
    }

    .booking-form .form-group .form-control:focus {
        border: 2px solid #ec6e39;
        box-shadow: none;
    }

    .booking-form .form-group textarea.form-control {
        height: 150px;
    }

    .booking-form .form-group select {
        height: 50px;
        background-color: transparent;
        border-radius: 0;
        border: 1px solid #e3e3e3;
        color: #222;
    }

    .booking-form .form-group select option {
        color: #222;
    }

    .booking-form .form-group select:focus {
        border: 2px solid #ec6e39;
        box-shadow: none;
    }

    .booking-form .form-group .input-group-text {
        background: transparent;
        border-radius: 0;
        border: 1px solid #e3e3e3;
        border-left: 0;
        height: 50px;
        line-height: 32px;
        color: #ff664e;
    }

    .booking-form .form-group .details span {
        color: #222;
        padding: 8px 0;
        font-style: italic;
        font-size: 12px;
    }

    .add-remove-icon {
        text-align: center;
        margin: 38px 0 0 0;
        font-size: 24px;
    }

    .add-remove-icon .fa-times-circle {
        color: #f40009;
    }

    .add-remove-icon .fa-plus-circle {
        color: #03c03c;
    }

    .form-check-input:checked {
        background-color: #ff664e;
        border-color: #ff664e;
    }

    .form-check-input:checked:focus {
        box-shadow: none;
    }

    .form-check-input[type="checkbox"] {
        border-radius: 0;
        margin-right: 10px;
    }

    .form-check-input {
        width: 1.2em;
        height: 1.2em;
    }
</style>
