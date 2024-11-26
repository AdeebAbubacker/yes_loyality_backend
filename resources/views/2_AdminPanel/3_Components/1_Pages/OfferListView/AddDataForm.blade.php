@php
    $OfferEdit = isset($Offer) ?? 0;
    if ($OfferEdit):
        if (isset($duplicate)):
            $route = 'AddOffer';
            $multiSelect = 'data-choices-removeItem multiple';
            $name = 'branch_id[]';
            $OfferStatus = 0;
        else:
            $route = 'EditOffer';
            $multiSelect = '';
            $name = 'branch_id';
            $OfferStatus = $Offer->active;
            $OfferBranchId = $Offer->branch_id;
            $OfferBranchName = $Offer->branch_name;
        endif;

        $OfferId = $Offer->id;
        $OfferName = $Offer->name;
        $OfferComment = $Offer->comments;
        $OfferSlug = $Offer->slug;
        $OfferMinAmount = $Offer->min_inv_amt;
        $OfferMaxAmount = $Offer->max_inv_amt;
        $OfferPoints = $Offer->points;
        $OfferDiscount = $Offer->discount;
        $OfferType = $Offer->type;
        $OfferUsageLimit = $Offer->usage_limit;
        $OfferEstart = $Offer->expiry_start;
        $OfferEends = $Offer->expiry_end;

        if ($OfferStatus == '1'):
            $Active = 'checked';
        else:
            $Inactive = 'checked';
        endif;
    else:
        $route = 'AddOffer';
        $multiSelect = 'data-choices-removeItem multiple';
        $name = 'branch_id[]';
    endif;

    if (isset($readonly)):
        $disabled = 'disabled' ?? null;
        $hidden = 'hidden' ?? null;
    else:
    endif;
    if (Auth::user()->role_id == 3):
        $selected = 'selected';
    else:
        $selected = '';
    endif;
@endphp


<form action="{{ route($route) }}" method="POST" id="CommonForm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{ $OfferId ?? null }}">
    <div class="row g-3">
        <div class="col-md-6">
            <div>
                <label for="branch" class="form-label">Branch <span class="required-indicator">*</span></label>
                <select class="form-select" id="branch_id" name="{{ $name }}" data-choices {{ $multiSelect }}
                    {{ $disabled ?? null }}>
                    <option value="{{ $OfferBranchId ?? null }}">{{ $OfferBranchName ?? 'Select Branch' }}
                    </option>
                    @foreach ($branches as $branch)
                        <option value="{{ $branch->id }}" {{ $selected }}>{{ $branch->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-md-6">
            <div>
                <label for="title" class="form-label">Offer Name <span class="required-indicator">*</span></label>
                <input type="text" class="form-control" id="title" name="name" placeholder="Enter Name"
                    value="{{ $OfferName ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-md-12">
            <div>
                <label for="comment" class="form-label">Description<span class="required-indicator">*</span></label>
                <textarea type="text" class="form-control" id="comment" name="comment" placeholder="Enter Comments"
                    {{ $disabled ?? null }} style="min-height:50px">{{ $OfferComment ?? null }}</textarea>
            </div>
        </div>

        <hr>

        <div class="col-md-6">
            <div>
                <label for="discount" class="form-label">Discount Value <span
                        class="required-indicator">*</span></label>
                <input type="number" class="form-control" id="discount" name="discount" placeholder="Enter Points"
                    value="{{ $OfferDiscount ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-md-6">
            <div>
                <label for="type" class="form-label">Discount Type <span class="required-indicator">*</span></label>
                <select class="form-select" id="type" name="type" data-choices {{ $disabled ?? null }}>
                    <option value="{{ $OfferType ?? null }}">{{ $OfferType ?? 'Select Type' }}
                    </option>
                    <option value="Percentage">Percentage</option>
                    <option value="Amount">Amount</option>

                </select>
            </div>
        </div>

        <hr>

        <div class="col-md-6">
            <div>
                <label for="min_amount" class="form-label">Minimum Purchase Amount <span
                        class="required-indicator">*</label>
                <input type="number" class="form-control" id="min_amount" name="min_amount"
                    placeholder="Enter Minimum Amount" value="{{ $OfferMinAmount ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-md-6">
            <div>
                <label for="max_amount" class="form-label">Maximum Redeemable Amount</label>
                <input type="number" class="form-control" id="max_amount" name="max_amount"
                    placeholder="Enter Maximum Amount" value="{{ $OfferMaxAmount ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div>

        <hr>

        <div class="col-md-4">
            <div>
                <label for="points" class="form-label">Points Required <span class="required-indicator">*</label>
                <input type="number" class="form-control" id="points" name="points" placeholder="Enter Points"
                    value="{{ $OfferPoints ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-md-4">
            <div>
                <label for="usage_limit" class="form-label">Usage Limit</label>
                <input type="number" class="form-control" id="usage_limit" name="usage_limit"
                    placeholder="Enter Usage Limit" value="{{ $OfferUsageLimit ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-md-4">
            <div>
                <label for="expiry_start" class="form-label">Valid From<span class="required-indicator">*</label>
                <input type="text" class="form-control" data-provider="flatpickr" id="expiry_start"
                    name="expiry_start" placeholder="Enter Expiry Start" value="{{ $OfferEstart ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-md-4">
            <div>
                <label for="expiry_ends" class="form-label">Valid To</label>
                <input type="text" class="form-control" data-provider="flatpickr" id="expiry_ends"
                    name="expiry_ends" placeholder="Enter Expiry Ends" value="{{ $OfferEends ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div>

        <div class="col-md-4">
            <div>
                <label for="slug" class="form-label">Slug<span class="required-indicator">*</label>
                <input type="text" class="form-control" id="slug" name="slug" placeholder="Enter Slug"
                    value="{{ $OfferSlug ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>

        <div class="col-md-4">
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
        {{-- <div class="col-md-12">
            <div id="ruleInputs">
                <!-- Initially, one input field with a delete button will be shown -->
                <div class="input-group mb-2">
                    <input type="text" class="form-control" name="rules[]" placeholder="Enter Rule"
                        row="2">
                    <button type="button" class="btn btn-danger deleteRule"><i class="fas fa-trash"></i></button>

                </div>
            </div>


        </div> --}}
        {{-- <button type="button" class="btn btn-primary" id="addRule">Add Rule</button> --}}
        <!--end col-->
        <div class="col-md-12">
            <div class="hstack gap-2 justify-content-end">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" {{ $hidden ?? null }}>Submit</button>
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
</form>
