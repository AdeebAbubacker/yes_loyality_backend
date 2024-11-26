@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    Edit Profile
@endsection



@section('content')
    <div class="position-relative mx-n4 mt-n4">
        <div class="profile-wid-bg profile-setting-img">
            <img src="{{ URL::asset('2_AdminPanel/images/3907187.jpg') }}" class="profile-wid-img" alt="">
        </div>
    </div>

    <div class="row">
        <div class="col-xxl-12">
            <div class="card mt-n5">
                <div class="card-body p-4">
                    <div class="text-center">
                        <div class="profile-user position-relative d-inline-block mx-auto  mb-4">
                            @if (Auth::user()->image != null)
                                <img class="rounded-circle avatar-xl img-thumbnail user-profile-image"
                                    src="{{ URL::asset('storage/file_uploads/user/' . Auth::user()->id . '/' . Auth::user()->image) }}"
                                    alt="Header Avatar">
                            @else
                                <img class="rounded-circle avatar-xl img-thumbnail user-profile-image"
                                    src="{{ URL::asset('2_AdminPanel/images//users/user-dummy-img.jpg') }}"
                                    alt="Header Avatar">
                            @endif
                            <div class="avatar-xs p-0 rounded-circle profile-photo-edit">
                                {{-- <input id="profile-img-file-input" type="file" class="profile-img-file-input"
                                    name="image"> --}}
                                <label id="profile-img-file-input" class="profile-photo-edit avatar-xs">
                                    <span class="avatar-title rounded-circle bg-light text-body">
                                        <i class="ri-camera-fill"></i>
                                    </span>
                                </label>
                            </div>
                        </div>
                        <h5 class="fs-16 mb-1">{{ $user->name }}</h5>
                        <p class="text-muted mb-0">
                            @if ($user->role_id == 1)
                                {{ 'Super Admin' }}
                            @elseif($user->role_id == 2)
                                {{ 'Admin' }}
                            @elseif($user->role_id == 3)
                                {{ 'Branch Manager' }}
                            @elseif($user->role_id == 4)
                                {{ 'Cashier' }}
                            @endif
                        </p>
                    </div>
                </div>
            </div>
            <!--end card-->
        </div>
        <!--end col-->
        <div class="col-xxl-12">
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs-custom rounded card-header-tabs border-bottom-0" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#personalDetails" role="tab">
                                <i class="fas fa-home"></i>
                                Personal Details
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#changePassword" role="tab">
                                <i class="far fa-user"></i>
                                Change Password
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="card-body p-4">
                    <div class="tab-content">
                        <div class="tab-pane active" id="personalDetails" role="tabpanel">
                            <form id="profile-edit" action="{{ route('EditDetails') }}" method="POST"
                                enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">
                                                Name</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                placeholder="Enter your firstname" value="{{ $user->name }}">
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="text" class="form-control" id="email" name="email"
                                                placeholder="Enter your lastname" value="{{ $user->email }}">
                                            <label id="email-error" class="error" for="email" hidden></label>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-lg-6">
                                        <div class="phone mb-0">
                                            <label for="phone" class="form-label">Phone
                                                Number</label>
                                            <input type="text" class="form-control" id="phone" name="phone"
                                                placeholder="Enter your phone number" value="{{ $user->phone }}">
                                            <label id="phone-error" class="error" for="phone" hidden></label>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="branch" class="form-label">Branch</label>
                                            <select class="form-control" name="branch" id="branch">
                                                <option value="{{ $user->branch ?? null }}">
                                                    {{ $user->store_name ?? 'Select Branch' }}
                                                </option>
                                                @foreach ($branches as $branch)
                                                    <option value="{{ $branch->id }}">{{ $branch->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <!--end col-->
                                    <div class="col-lg-12">
                                        <div class="hstack gap-2 justify-content-end">
                                            <button type="submit" class="btn btn-primary">Update</button>
                                            {{-- <button type="button" class="btn btn-soft-success">Cancel</button> --}}
                                        </div>
                                    </div>
                                    <!--end col-->
                                </div>
                                <!--end row-->
                            </form>
                        </div>
                        <!--end tab-pane-->
                        <div class="tab-pane" id="changePassword" role="tabpanel">
                            <form id="change-password" action="{{ route('ChangePassword') }}" method="POST"
                                enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div>
                                            <label for="current_password" class="form-label">Old
                                                Password*</label>
                                            <div class="position-relative auth-pass-inputgroup">
                                                <input type="password" class="form-control" id="current_password"
                                                    name="current_password" placeholder="Enter current password">
                                                <button
                                                    class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                                                    type="button" id="password-addon" data-target="current_password"><i
                                                        class="ri-eye-fill align-middle"></i></button>
                                            </div>
                                            <label id="current_password-error" class="error" for="current_password"></label>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-lg-4">
                                        <div>
                                            <label for="new_password" class="form-label">New
                                                Password*</label>
                                            <div class="position-relative auth-pass-inputgroup">
                                                <input type="password" class="form-control" id="new_password"
                                                    name="new_password" placeholder="Enter new password">
                                                <button
                                                    class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                                                    type="button" id="password-addon" data-target="new_password"><i
                                                        class="ri-eye-fill align-middle"></i></button>
                                            </div>
                                            <label id="new_password-error" class="error" for="new_password"></label>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-lg-4 mb-2">
                                        <div>
                                            <label for="confirm_password" class="form-label">Confirm
                                                Password*</label>
                                            <div class="position-relative auth-pass-inputgroup">
                                                <input type="password" class="form-control" id="confirm_password"
                                                    name="confirm_password" placeholder="Confirm password">
                                                <button
                                                    class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                                                    type="button" id="password-addon" data-target="confirm_password"><i
                                                        class="ri-eye-fill align-middle"></i></button>
                                            </div>
                                            <label id="confirm_password-error" class="error" for="confirm_password"></label>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    {{-- <div class="col-lg-12">
                                        <div class="mb-3">
                                            <a href="javascript:void(0);"
                                                class="link-primary text-decoration-underline">Forgot
                                                Password ?</a>
                                        </div>
                                    </div> --}}
                                    <!--end col-->
                                    <div class="col-lg-12">
                                        <div class="text-end">
                                            <button type="submit" class="btn btn-success">Change
                                                Password</button>
                                        </div>
                                    </div>
                                    <!--end col-->
                                </div>
                                <!--end row-->
                            </form>
                        </div>
                        <!--end tab-pane-->
                    </div>
                </div>
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
@endsection
