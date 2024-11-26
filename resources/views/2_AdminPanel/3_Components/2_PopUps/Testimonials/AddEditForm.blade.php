@php
    $Edit = isset($Testimonial) ?? 0;
    if ($Edit):
        $Id = $Testimonial->Id;
        $Name = $Testimonial->Name;
        $Title = $Testimonial->Title;
        $Message = $Testimonial->Message;
        $Image = $Testimonial->Image;
        $Active = $Testimonial->Active;
        $Featured = $Testimonial->Featured ? 1 : 0;
    
        if ($Image) {
            $Image = asset("3_FileUploads/4_Testominials/$Image");
        } else {
            $Image = config('const.placeholder');
        }
    else:
    $Image = config('const.placeholder');
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateTestimonial') }}" enctype="multipart/form-data">
    @csrf

    <div class="col-lg-12">
        <label for="FullName" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="FullName" name="Name" placeholder="Enter Full Name" value="{{ $Name ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="Title" class="form-label">Title</label>
        <input type="text" class="form-control" id="Title" name="Title" placeholder="Enter Title" value="{{ $Title ?? "" }}">
    </div>

    <div class="col-lg-12" id="Image">
        <label for="Image" class="form-label">Image</label>
        {{-- <input class="form-control" type="file" id="Image" name="Image[]"> --}}
    </div>

    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <img src="{{ asset($Image) }}" class="card-img-top" id="ImagePreview" alt="" />
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <label for="Message" class="form-label">Message</label>
        <textarea class="form-control" id="Message" name="Message">{{ $Message ?? NULL }}</textarea>
    </div>

    <div class="col-lg-12">
        <div class="form-check form-switch form-switch-lg" dir="ltr">
            <input type="checkbox" class="form-check-input" id="FeaturedToggle" name="Featured" {{ ($Featured ?? 0) ? "checked" : NULL }}>
            <label class="form-check-label" for="FeaturedToggle">Featured Testimonial</label>
        </div>
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

