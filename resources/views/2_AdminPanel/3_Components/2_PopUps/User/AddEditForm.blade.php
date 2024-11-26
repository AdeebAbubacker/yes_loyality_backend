@php
    $Edit = isset($User) ? 1 : 0;
    if ($Edit):
        $Id = $User->Id;
        $Name = $User->Name;
        $Email = $User->Email;
        $Phone = $User->Phone;
        $Role = $User->Date;
        $Message = $User->Message;
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateUser') }}" enctype="multipart/form-data">
    @csrf

    <div class="col-lg-12">
        <label for="PatientName" class="form-label">Name</label>
        <input type="text" class="form-control" id="PatientName" name="Name" placeholder="Enter Full Name" value="{{ $Name ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="PatientEmail" class="form-label">Email</label>
        <input type="email" class="form-control User-info" id="PatientEmail" name="Email" placeholder="Enter Full Email" value="{{ $Email ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="PatientPhone" class="form-label">Phone</label>
        <input type="tel" class="form-control User-info" id="PatientPhone" name="Phone" placeholder="Enter Full Phone" value="{{ $Phone ?? "" }}">
    </div>
    <div class="col-lg-12">
        <label for="Password" class="form-label">password</label>
        <input type="password" class="form-control User-info" id="PatientPassword" name="Password" placeholder="Enter Password" value="{{ $Password ?? "" }}">
    </div>
    <div class="row mb-3">
        <label class="col-sm-12 col-form-label">Roles</label>
        <div class="col-sm-12">
            <select class="form-select HasSub" data-sub="" data-InitVal="" name="Role" id="">
                <option value="">Select Roles</option>
                @foreach ((new App\Http\Controllers\Admin\RolepermitsController())->RoleName() as $value)
                    <option value="{{ $value->id }}"> {{ $value->Name }} </option>
                @endforeach
            </select>
        </div>
    </div>
    {{-- <div class="col-lg-4 col-md-6">
        <div>
            <p class="text-muted fw-medium">User Type</p>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="2" checked>
                <label class="form-check-label" for="flexRadioDefault2">
                    Agent
                </label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="1">
                <label class="form-check-label" for="flexRadioDefault1">
                    Admin
                </label>
            </div>
        </div>
        
    </div> --}}
  

    <div class="col-lg-12">
        <div class="hidden">
            <input class="form-control" type="hidden" name="Id" value="{{ $Id ?? "" }}">
        </div>
        <div class="hstack gap-2 justify-content-end">
            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>

</form>