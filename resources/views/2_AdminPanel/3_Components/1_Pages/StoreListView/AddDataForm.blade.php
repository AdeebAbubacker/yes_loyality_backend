@php
    $StoreEdit = isset($Store) ?? 0;
    if ($StoreEdit):
        $route = 'EditStore';
        $StoreId = $Store->id;
        $StoreName = $Store->name;
        $StoreLocation = $Store->location;
        $StoreAddress = $Store->address;
        $StoreCoordinates = $Store->coordinates;
        $StoreKeyName = $Store->key_name;
        $StoreSupportName = $Store->support_name;
        $StoreEmail_1 = $Store->email_1;
        $StoreEmail_2 = $Store->email_2;
        $StorePhone_1 = $Store->phone_1;
        $StorePhone_2 = $Store->phone_2;

        $StoreStatus = $Store->active;

        if ($StoreStatus == '1'):
            $Active = 'checked';
        else:
            $Inactive = 'checked';
        endif;
    else:
        $route = 'AddStore';
    endif;

    if (isset($readonly)):
        $disabled = 'disabled' ?? null;
        $hidden = 'hidden' ?? null;
    else:
    endif;
    if (Auth::user()->role_id > 2):
        $readonly = 'readonly';
        $hide = 'hidden';
    else:
        $readonly = '';
        $hide = '';
    endif;
@endphp


<form action="{{ route($route) }}" method="POST" id="CommonForm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{ $StoreId ?? null }}">
    <div class="row g-3">
        <div class="col-lg-12">
            <div>
                <label for="title" class="form-label">Store Name <span class="required-indicator">*</label>
                <input type="text" class="form-control" id="title" name="name" placeholder="Enter Name"
                    value="{{ $StoreName ?? $merchant_name }}" {{ $disabled ?? null }} {{ $readonly }} />
            </div>
        </div>

        <div class="col-lg-12">
            <div>
                <label for="address" class="form-label">Store Address <span class="required-indicator">*</label>
                <textarea type="text" class="form-control" id="address" name="address" placeholder="Enter Address" row="2"
                    value="" {{ $disabled ?? null }}>{{ $StoreAddress ?? null }}</textarea>
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="location" class="form-label">Location <span class="required-indicator">*</label>
                <input type="text" class="form-control" id="location" name="location" placeholder="Enter Location"
                    value="{{ $StoreLocation ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="coordinates" class="form-label"> Geographic Coordinates <span class="required-indicator">*</label>
                <input type="text" class="form-control" id="coordinates" name="coordinates"
                    placeholder="41°24′12.2″N 2°10′26.5″E" value="{{ $StoreCoordinates ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <p class="mb-0">Key Contact</p>
            <hr>
            <div>
                <label for="key_name" class="form-label">Key Name <span class="required-indicator">*</label>
                <input type="text" class="form-control" id="key_name" name="key_name" placeholder="Enter Key Name"
                    value="{{ $StoreKeyName ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <p class="mb-0">Support Contact</p>
            <hr>
            <div>
                <label for="support_name" class="form-label">Support Name <span></span></label>
                <input type="text" class="form-control" id="support_name" name="support_name" placeholder="Enter Support Name"
                    value="{{ $StoreSupportName ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="email_1" class="form-label">Key Email <span class="required-indicator">*</label>
                <input type="email" class="form-control" id="email_1" name="email_1" placeholder="Enter Key Email"
                    value="{{ $StoreEmail_1 ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="email_2" class="form-label">Support Email <span></span></label>
                <input type="email" class="form-control" id="email_2" name="email_2" placeholder="Enter Support Email"
                    value="{{ $StoreEmail_2 ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <div class="phone_1">
                <label for="phone_1" class="form-label">Key Phone<span class="required-indicator">*</label>
                <input type="tel" class="form-control" id="phone_1" name="phone_1" placeholder="Enter Key Phone"
                    value="{{ $StorePhone_1 ?? null }}" {{ $disabled ?? null }} />
                {{-- <label id="phone_1-error" class="error" for="phone_1"></label> --}}
            </div>
        </div>
        <div class="col-lg-6">
            <div class="phone_2">
                <label for="phone_2" class="form-label">Support Phone <span></span></label>
                <input type="tel" class="form-control" id="phone_2" name="phone_1" placeholder="Enter Support Phone"
                    value="{{ $StorePhone_2 ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        
        <div class="col-lg-6" {{ $hide }}>
            <label class="form-label">Status</label>
            <div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="1"
                        {{ $Active ?? 'checked' }} {{ $disabled ?? null }}>
                    <label class="form-check-label" for="inlineRadio1">Active</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="0"
                        {{ $Inactive ?? null }} {{ $disabled ?? null }}>
                    <label class="form-check-label" for="inlineRadio2">Inactive</label>
                </div>
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
