@php
    $Edit = isset($Role) ? 1 : 0;
    if ($Edit):
        $Id = $Role->Id;
        $Name = $Role->Name;
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateRolepermits') }}" enctype="multipart/form-data">
    @csrf



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

    <div class="row mb-3">
        <label class="col-sm-12 col-form-label">Modules</label>
        <div class="col-sm-12">
            <select class="form-select HasSub" data-sub="" data-InitVal="" name="Module" id="">
                <option value="">Select module</option>
                @foreach ((new App\Http\Controllers\Admin\RolepermitsController())->ModuleName() as $value)
                    <option value="{{ $value->id }}"> {{ $value->Name }} </option>
                @endforeach
            </select>
        </div>
    </div>


    <div class="events-area grey-bg pt-120 pb-110">
        <div class="container">

            <div class="row gx-3">
                <div class="row mb-3">
                    <!-- Add checkboxes for four values here -->
                    <label class="col-sm-12 col-form-label">Permissions</label>
                    <label>
                        <input type="checkbox" name="Create" value="1"> Create
                    </label>
                    <label>
                        <input type="checkbox" name="Read" value="1"> Read
                    </label>
                    <label>
                        <input type="checkbox" name="Update" value="1"> Update
                    </label>
                    <label>
                        <input type="checkbox" name="Delete" value="1"> Delete
                    </label>
                </div>

                <!-- Your existing code for displaying images -->
                <!-- ... -->

            </div>
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
