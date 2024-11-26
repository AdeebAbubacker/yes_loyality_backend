@php
    $Edit = isset($Module) ? 1 : 0;
    if ($Edit):
        $Id = $Module->Id;
        $Name = $Module->Name;
        $Slug = $Module->Slug;
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateModule') }}" enctype="multipart/form-data">
    @csrf

    <div class="col-lg-12">
        <label for="PatientName" class="form-label">Name</label>
        <input type="text" class="form-control" id="PatientName" name="Name" placeholder="Enter Full Name"
            value="{{ $Name ?? '' }}">
    </div>

    <div class="col-lg-12">
        <label for="PatientEmail" class="form-label">Slug</label>
        <input type="text" class="form-control User-info" id="PatientEmail" name="Slug" placeholder="Enter Slug"
            value="{{ $Slug ?? '' }}">
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


    <div class="col-lg-2" id="customFieldsContainer">
        <div class="custom-fields">
            <label for="" class="form-label" style="width: 100%;">Custom</label>
            <input type="text" class="form-control1" id="" name="custom_label[]" placeholder="Enter Access"
                value="{{ $Access ?? '' }}">
            <select name="custom_value[]">
                <option value="1">TRUE</option>
                <option value="0">FALSE</option>
            </select>
            {{-- <label>
                <input type="radio" name="custom_value[]" value="1"> add
            </label>
            <label>
                <input type="radio" name="custom_value[]" value="0"> Delete
            </label> --}}
        </div>
    </div>
    <div class="col-lg-12 mt-2">
        <button type="button" class="btn btn-primary" onclick="addCustomFields()">Add</button>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    function addCustomFields() {
      
        var clonedFields = $('.custom-fields:first').clone();
        clonedFields.find('input[type="text"]').val('');
        clonedFields.find('input[type="radio"]').prop('checked', false);        
        $('#customFieldsContainer').append(clonedFields);
    } 
</script>
