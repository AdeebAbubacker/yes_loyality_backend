@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    Profile
@endsection



@section('content')
    <div class="profile-foreground position-relative mx-n4 mt-n4">
        <div class="profile-wid-bg">
            <img src="{{ URL::asset('2_AdminPanel/images/3907187.jpg') }}" alt="" class="profile-wid-img" />
        </div>
    </div>
    <div class="pt-4 mb-4 mb-lg-3 pb-lg-4 profile-wrapper">
        <div class="row g-4">
            <div class="col-auto">
                <div class="profile-user">
                    @if (Auth::user()->image != null)
                                <img class="img-thumbnail rounded-circle avatar-xl"
                                    src="{{ URL::asset('storage/file_uploads/user/' . Auth::user()->id . '/' . Auth::user()->image) }}"
                                    alt="Header Avatar">
                            @else
                                <img class="img-thumbnail rounded-circle avatar-xl"
                                    src="{{ URL::asset('2_AdminPanel/images//users/user-dummy-img.jpg') }}"
                                    alt="Header Avatar">
                            @endif
                </div>
            </div>
            <!--end col-->
            <div class="col">
                <div class="p-2">
                    <h3 class="text-white mb-1">{{ $user->name }}</h3>
                    <p class="text-white-75">
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
                    <div class="hstack text-white-50 gap-1">
                        @if ($user->store_name)
                            <div class="me-2"><i
                                    class="ri-map-pin-user-line me-1 text-white-75 fs-16 align-middle"></i>{{ $user->store_name }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            <!--end col-->

        </div>
        <!--end row-->
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div>
                <div class="d-flex profile-wrapper justify-content-end">
                    <div class="flex-shrink-0">
                        <a href="{{ route('EditProfile') }}" class="btn btn-success"><i
                                class="ri-edit-box-line align-bottom"></i> Edit Profile</a>
                    </div>
                </div>
                <!-- Tab panes -->
                <div class="tab-content pt-4 text-muted">
                    <div class="tab-pane active" id="overview-tab" role="tabpanel">
                        <div class="row">
                            <div class="col-xxl-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title mb-3">Profile Info</h5>
                                        <div class="table-responsive">
                                            <table class="table table-borderless mb-0">
                                                <tbody>
                                                    <tr>
                                                        <th class="ps-0" scope="row">Full Name :</th>
                                                        <td class="text-muted">{{ $user->name }}</td>
                                                    </tr>
                                                    <tr>
                                                        <th class="ps-0" scope="row">Mobile :</th>
                                                        <td class="text-muted">{{ $phone_no }}</td>
                                                    </tr>
                                                    <tr>
                                                        <th class="ps-0" scope="row">Role :</th>
                                                        <td class="text-muted">
                                                            @if ($user->role_id == 1)
                                                                {{ 'Super Admin' }}
                                                            @elseif($user->role_id == 2)
                                                                {{ 'Admin' }}
                                                            @elseif($user->role_id == 3)
                                                                {{ 'Branch Manager' }}
                                                            @elseif($user->role_id == 4)
                                                                {{ 'Cashier' }}
                                                            @endif
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th class="ps-0" scope="row">E-mail :</th>
                                                        <td class="text-muted">{{ $user->email }}</td>
                                                    </tr>
                                                    @if ($user->store_name)
                                                        <tr>
                                                            <th class="ps-0" scope="row">Branch :</th>
                                                            <td class="text-muted">{{ $user->store_name }}
                                                            </td>
                                                        </tr>
                                                    @endif

                                                </tbody>
                                            </table>
                                        </div>
                                    </div><!-- end card body -->
                                </div><!-- end card -->
                            </div>
                            <!--end col-->
                        </div>
                        <!--end row-->
                    </div>
                </div>
                <!--end tab-content-->
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
@endsection
