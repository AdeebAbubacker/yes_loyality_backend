<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0 font-size-18">{{ $li_1 }}</h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item">Home</li>
                    @if(isset($title))
                        <li class="breadcrumb-item active">{{ $li_1 }}</li>
                    @endif
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->
