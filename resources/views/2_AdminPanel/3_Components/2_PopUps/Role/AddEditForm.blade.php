@php
    $Edit = isset($Role) ? 1 : 0;
    if ($Edit):
        $Id = $Role->Id;
        $Name = $Role->Name;
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateRole') }}" enctype="multipart/form-data">
    @csrf

    <div class="col-lg-12">
        <label for="PatientName" class="form-label">Name</label>
        <input type="text" class="form-control" id="PatientName" name="Name" placeholder="Enter Full Name"
            value="{{ $Name ?? '' }}">
    </div>


    </div>
    <div class="col-lg-12">
        <div class="hidden">
            <input class="form-control" type="hidden" name="Id" value="{{ $Id ?? '' }}">
        </div>
        <div class="hstack gap-2 justify-content-end">
            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>

</form>
