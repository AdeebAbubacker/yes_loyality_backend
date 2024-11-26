<form action="{{ route('LoyalitySectionAddUser') }}" method="POST" id="CommonForm" enctype="multipart/form-data">
    <div class="row g-3">

        <div class="col-lg-12">
            <div>
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"
                    value="" />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email"
                    value="" />
            </div>
            <label id="email-error" class="error" for="email"></label>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="phone" class="form-label">Phone</label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Phone"
                    value="" />
            </div>
            <label id="phone-error" class="error" for="phone"></label>
        </div>
        <div class="col-lg-12">
            <!-- Info Alert -->
            <div class="alert alert-info material-shadow" role="alert">
                The Password will be Users Phone Number
            </div>
        </div>
        <!--end col-->
        <div class="col-lg-12">
            <div class="hstack gap-2 justify-content-end">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                <button id="btn-country" type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>

        <!--end col-->
    </div>
    <!--end row-->
</form>
