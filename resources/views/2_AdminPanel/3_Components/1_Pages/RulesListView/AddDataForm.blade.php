@php
    $RuleEdit = isset($rule) ?? 0;
    if ($RuleEdit):
        $route = 'EditRules';
        $RuleId = $rule->id;
        $RuleMinAmount = $rule->min_amt;
        $RulePoint = $rule->point_received;

      
    else:
        $route = 'AddRules';
    endif;

    if (isset($readonly)):
        $disabled = 'disabled' ?? null;
        $hidden = 'hidden' ?? null;
    else:
    endif;
@endphp


<form action="{{ route($route) }}" method="POST" id="CommonForm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{ $RuleId ?? null }}">
    <div class="row g-3">
        <div class="col-lg-6">
            <div>
                <label for="min_amt" class="form-label">Minimum Amount<span class="required-indicator">*</label>
                <input type="number" class="form-control" id="min_amt" name="min_amt" placeholder="Enter Minimum Amount"
                    value="{{ $RuleMinAmount ?? null }}" {{ $disabled ?? null }} />
                    <label id="min_amt-error" class="error" for="min_amt"></label>
            </div>
        </div>

        <div class="col-lg-6">
            <div>
                <label for="point" class="form-label">Points<span class="required-indicator">*</label>
                <input type="number" class="form-control" id="point" name="point" placeholder="Enter Points" row="2"
                    value="{{ $RulePoint ?? null }}" {{ $disabled ?? null }} />
                    <label id="point-error" class="error" for="point"></label>
            </div>
        </div>
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
