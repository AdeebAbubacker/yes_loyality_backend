@php
    $Edit = isset($BlogCat) ? 1 : 0;
    if ($Edit):
        $Id = $BlogCat->Id;
        $Name = $BlogCat->Name;
        $Featured = $BlogCat->Featured ? 1 : 0;
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateCategory') }}" enctype="multipart/form-data">
    @csrf

    <div class="col-lg-12">
        <label for="CatName" class="form-label">Category Name</label>
        <input type="text" class="form-control" id="CatName" name="Name" placeholder="Enter Category" value="{{ $Name ?? "" }}">    </div>

    {{-- <div class="col-lg-12">
        <div class="form-check form-switch form-switch-lg" dir="ltr">
            <input type="checkbox" class="form-check-input" id="FeaturedToggle" name="Featured" {{ ($Featured ?? 0) ? "checked" : NULL }}>
            <label class="form-check-label" for="FeaturedToggle">Featured Category</label>
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