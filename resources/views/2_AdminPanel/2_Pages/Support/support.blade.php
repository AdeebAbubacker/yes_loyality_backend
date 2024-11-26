@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    Get Support
@endsection



@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Get Support
        @endslot
        @slot('title')
            Page
        @endslot
    @endcomponent

    <div class="row">
        <div class="col-xxl-12">
            <div class="card">
                <div class="card-body">
                    <div class="live-preview">
                        <form id="get-support" action="{{ route('SupportForm') }}" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name<span class="required-indicator">*</span></label>
                                        <input type="text" class="form-control" placeholder="Enter your Name"
                                            name="name" id="name">
                                    </div>
                                </div><!--end col-->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email<span class="required-indicator">*</span></label>
                                        <input type="email" class="form-control" placeholder="Enter your Email"
                                            name="email" id="email">
                                    </div>
                                </div><!--end col-->
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="subject" class="form-label">Subject<span class="required-indicator">*</span></label>
                                        <textarea type="text" class="form-control" placeholder="Enter Subject" name="subject" id="subject"></textarea>
                                    </div>
                                </div><!--end col-->
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="message" class="form-label">Message<span class="required-indicator">*</span></label>
                                        <textarea type="text" class="form-control" placeholder="Enter Message" name="message" id="message"></textarea>
                                    </div>
                                </div><!--end col-->
                                <div class="col-lg-12">
                                    <div class="text-end">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end col -->
@endsection
