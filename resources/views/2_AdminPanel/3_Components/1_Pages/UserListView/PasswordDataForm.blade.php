@php
    $UserEdit = isset($User) ?? 0;
    if ($UserEdit):
        $UserId = $User->id;
    else:
    endif;
@endphp
<form action="{{ route('ChangeUserPassword') }}" method="POST" id="CommonForm" enctype="multipart/form-data">

    <input type="hidden" name="id" value="{{ $UserId ?? null }}">
    <div class="row g-3">
        <div class="col-lg-12">
            <div>
                <label for="password" class="form-label">Password</label>
                <div class="position-relative auth-pass-inputgroup">
                    <input type="password" class="form-control" id="password" name="password"
                        placeholder="Enter Password" value="" />
                    <button
                        class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                        type="button" id="password-addon" data-target="password"><i
                            class="ri-eye-fill align-middle"></i></button>
                </div>
                <label id="password-error" class="error" for="password"></label>
            </div>
        </div>
        <div class="col-lg-12 mt-1">
            <div>
                <label for="confirm_password" class="form-label">Confirm Password</label>
                <div class="position-relative auth-pass-inputgroup">
                    <input type="password" class="form-control" id="confirm_password" name="confirm_password"
                        placeholder="Confirm Password" value="" />
                    <button
                        class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                        type="button" id="password-addon" data-target="confirm_password"><i
                            class="ri-eye-fill align-middle"></i></button>
                </div>
                <label id="confirm_password-error" class="error" for="confirm_password"></label>
            </div>
        </div>
        <!--end col-->
        <div class="col-lg-12">
            <div class="hstack gap-2 justify-content-end">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>

                <button type="submit" class="btn btn-primary">Submit</button>

            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
</form>
