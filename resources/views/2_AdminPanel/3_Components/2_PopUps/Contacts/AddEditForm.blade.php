@php
    $Edit = isset($Contact) ? 1 : 0;
    if ($Edit):
        $Id = $Contact->Id;
        $Name = $Contact->Name;
        $Email = $Contact->Email;
        $Phone = $Contact->Phone;
        $Date = $Contact->Date;
        $Message = $Contact->Message;
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateContact') }}" enctype="multipart/form-data">
    @csrf

    <div class="col-lg-12">
        <label for="PatientName" class="form-label">Name</label>
        <input type="text" class="form-control" id="PatientName" name="Name" placeholder="Enter Full Name" value="{{ $Name ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="PatientEmail" class="form-label">Email</label>
        <input type="email" class="form-control contact-info" id="PatientEmail" name="Email" placeholder="Enter Full Email" value="{{ $Email ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="PatientPhone" class="form-label">Phone</label>
        <input type="tel" class="form-control contact-info" id="PatientPhone" name="Phone" placeholder="Enter Full Phone" value="{{ $Phone ?? "" }}">
    </div>

    {{-- <div class="col-lg-12">
        <label for="PatientSubject" class="form-label">Subject</label>
        <input type="text" class="form-control" id="PatientSubject" name="Subject" placeholder="Enter Subject" value="{{ $Subject ?? "" }}">
    </div> --}}

    <div class="col-lg-12">
        <label for="PatientMessage" class="form-label">Message</label>
        <textarea class="form-control" id="PatientMessage" name="Message" placeholder="Enter Message">{{ $Message ?? "" }}</textarea>
    </div>

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