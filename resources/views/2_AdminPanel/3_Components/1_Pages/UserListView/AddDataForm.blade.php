@php
    $UserEdit = isset($User) ?? 0;
    if ($UserEdit):
        $route = 'EditUser';
        $UserId = $User->id;
        $UserName = $User->name;
        $UserBranch = $User->branch;
        $UserBranchName = $User->store_name;
        $UserEmail = $User->email;
        $UserPhone = $User->phone;
        $UserRoleId = $User->role_id;

        if ($UserRoleId == '1'):
            $UserRole = 'Super Admin';
        elseif ($UserRoleId == '2'):
            $UserRole = 'Admin';
        elseif ($UserRoleId == '3'):
            $UserRole = 'Branch Manager';
        elseif ($UserRoleId == '4'):
            $UserRole = 'Cashier';
        elseif ($UserRoleId == '5'):
            $UserRole = 'User';
        endif;

        $UserStatus = $User->active;

        if ($UserStatus == '1'):
            $Active = 'checked';
        else:
            $Inactive = 'checked';
        endif;

        $hidden = 'hidden' ?? null;
        if ($UserBranch):
            $branchHide = '';
        else:
            $branchHide = 'hidden';
        endif;
    else:
        $branchHide = 'hidden';
        $route = 'AddUser';
    endif;

    if (isset($readonly)):
        $disabled = 'disabled' ?? null;
        $hide = 'hidden' ?? null;
    else:
    endif;

    if (Auth::user()->role_id == 3 || Auth::user()->role_id == 4):
        $hide_branch = 'hidden' ?? null;
    else:
    endif;
@endphp


<form action="{{ route($route) }}" method="POST" id="CommonForm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{ $UserId ?? null }}">
    <div class="row g-3">
        <div class="col-lg-12">
            <div>
                <label for="name" class="form-label">Name<span class="required-indicator">*</span></label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"
                    value="{{ $UserName ?? null }}" {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-12">
            <div>
                <label for="email" class="form-label">Email<span class="required-indicator">*</span></label>
                <input type="text" class="form-control" id="email" name="email" placeholder="Enter email"
                    value="{{ $UserEmail ?? null }}" {{ $disabled ?? null }} />
                <label id="email-error" class="error" for="email"></label>
            </div>

        </div>

        <div class="col-lg-6">
            <div>
                <label for="branch" class="form-label">Role<span class="required-indicator">*</span></label>
                <select class="form-select" id="role" name="role" data-choices {{ $disabled ?? null }}>
                    <option value="{{ $UserRoleId ?? null }}">{{ $UserRole ?? 'Select User Type' }}
                    </option>
                    @if (Auth::user()->role_id == 1)
                        <option value="1">Super Admin</option>
                        <option value="2">Admin</option>
                    @endif
                    @if (Auth::user()->role_id < 3)
                        <option value="3">Branch Manager</option>
                    @endif
                    <option value="4">Cashier</option>
                    <option value="5">User</option>
                </select>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="phone">
                <label for="phone" class="form-label">Phone<span class="required-indicator">*</span></label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Phone"
                    value="{{ $UserPhone ?? null }}" {{ $disabled ?? null }} />
            </div>
            <label id="full_phone-error" class="error"></label>
        </div>

        <div class="col-lg-12" {{ $hidden ?? null }}>
            <div>
                <label for="password" class="form-label">Password<span class="required-indicator">*</span></label>
                <div class="position-relative auth-pass-inputgroup">
                    <input type="password" class="form-control" id="password" name="password"
                        placeholder="Enter password" value="" {{ $disabled ?? null }} />
                    <button
                        class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                        type="button" id="password-addon" data-target="password"><i
                            class="ri-eye-fill align-middle"></i></button>
                </div>
                <label id="password-error" class="error" for="email"></label>

            </div>
        </div>
        <div class="col-lg-12" {{ $hidden ?? null }}>
            <div>
                <label for="c_password" class="form-label">Confirm Password<span class="required-indicator">*</span></label>
                <div class="position-relative auth-pass-inputgroup">
                    <input type="password" class="form-control" id="c_password" name="c_password"
                        placeholder="Confirm password" value="" {{ $disabled ?? null }} />
                    <button
                        class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                        type="button" id="password-addon" data-target="c_password"><i
                            class="ri-eye-fill align-middle"></i></button>
                </div>
            </div>
        </div>
        <div class="col-lg-6" id="branchSection" {{ $branchHide }}>
            <div>
                <label for="branch" class="form-label">Branch<span class="required-indicator">*</span></label>
                <select class="form-select" id="branch" name="branch" data-choices {{ $disabled ?? null }}>
                    <option value="{{ $UserBranch ?? null }}">{{ $UserBranchName ?? 'Select Branch' }}
                    </option>

                    @foreach ($branches as $branch)
                        @if (Auth::user()->role_id > 2)
                            <option value="{{ $branch->id }}" selected>{{ $branch->name }} </option>
                        @else
                            <option value="{{ $branch->id }}">{{ $branch->name }} </option>
                        @endif
                    @endforeach

                </select>
            </div>
        </div>
        <div class="col-lg-6">
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
                <button type="submit" class="btn btn-primary" {{ $hide ?? null }}>Submit</button>
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
</form>
