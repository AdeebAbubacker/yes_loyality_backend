@php
    if (isset($merchant_info)):
        $route = 'EditMerchant';
    else:
        $route = 'AddMerchant';
    endif;
    if(Auth::user()->role_id == 1):
        $readonly = '';
    else:
        $readonly = 'readonly';
    endif;
@endphp

<form action="{{ route($route) }}" method="POST" id="CommonForm" enctype="multipart/form-data">
    <div class="row g-3">
        <div class="col-lg-12">
            <div>
                <label for="title" class="form-label">Merchant Name<span class="required-indicator">*</label>
                <input type="text" class="form-control" id="title" name="name" placeholder="Enter Name"
                    value="{{ $merchant_info['name'] ?? null }}" {{ $readonly }} />
            </div>
        </div>

        <div class="col-lg-12">
            <div>
                <label for="address" class="form-label">Address <span class="required-indicator">*</label>
                <textarea type="text" class="form-control" id="address" name="address" placeholder="Enter Address" row="2"
                    value="">{{ $merchant_info['address'] ?? null }}</textarea>
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="location" class="form-label">Location <span class="required-indicator">*</label>
                <input type="text" class="form-control" id="location" name="location" placeholder="Enter Location"
                    value="{{ $merchant_info['location'] ?? null }}" />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="coordinates" class="form-label">Coordinates <span class="required-indicator">*</label>
                <input type="text" class="form-control" id="coordinates" name="coordinates"
                    placeholder="Enter Coordinates" value="{{ $merchant_info['coordinates'] ?? null }}" />
            </div>
        </div>
        <div class="col-lg-6">
            <p class="mb-0">Key Contact</p>
            <hr>
            <div>
                <label for="name_1" class="form-label">Name <span class="required-indicator">*</label>
                <input type="name" class="form-control" id="name_1" name="name_1" placeholder="Enter Name"
                    value="{{ $merchant_info['name_1'] ?? null }}" />
            </div>
        </div>
        <div class="col-lg-6">
            <p class="mb-0">Support Contact</p>
            <hr>
            <div>
                <label for="name_2" class="form-label">Name <span></span></label>
                <input type="name" class="form-control" id="name_2" name="name_2" placeholder="Enter Name"
                    value="{{ $merchant_info['name_2'] ?? null }}" />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="email_1" class="form-label">Email <span class="required-indicator">*</label>
                <input type="email" class="form-control" id="email_1" name="email_1" placeholder="Enter Email"
                    value="{{ $merchant_info['email_1'] ?? null }}" />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="email_2" class="form-label">Email <span></span></label>
                <input type="email" class="form-control" id="email_2" name="email_2" placeholder="Enter Email"
                    value="{{ $merchant_info['email_2'] ?? null }}" />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="phone_1" class="form-label">Phone<span class="required-indicator">*</label>
                <input type="tel" class="form-control" id="phone_1" name="phone_1" placeholder="Enter Phone"
                    value="{{ $merchant_info['phone_1'] ?? null }}" />
                <label id="phone_1-error" class="error" for="phone_1"></label>
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="phone_2" class="form-label">Phone <span></span></label>
                <input type="tel" class="form-control" id="phone_2" name="phone_2" placeholder="Enter Phone"
                    value="{{ $merchant_info['phone_2'] ?? null }}" />
                <label id="phone_2-error" class="error" for="phone_2"></label>
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="currency" class="form-label">Currency <span class="required-indicator">*</label>
                <input type="text" class="form-control" id="currency" name="currency"
                    placeholder="$" value="{{ $currency->value ?? null }}" />
            </div>
        </div>
        <!--end col-->
        <div class="col-lg-12">
            <div class="hstack gap-2 justify-content-end">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" {{ $hidden ?? null }}>Submit</button>
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
</form>
