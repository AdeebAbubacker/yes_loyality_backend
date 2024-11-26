@extends('2_AdminPanel.1_Layouts.1_MainLayout')
@section('title')
    @lang('translation.starter')
@endsection
@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Pages
        @endslot
        @slot('title')
            Events
        @endslot
    @endcomponent

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header align-items-center d-flex">

                    <form action="javascript:void(0);" class="row g-3">
                        <h3 class="form-label">EVENTS</h3>

                        <div class="col-lg-12">
                            <label for="fullnameInput" class="form-label">Title</label>
                            <input type="text" class="form-control" id="fullnameInput" placeholder="Enter your title">
                        </div>
                        <div class="col-lg-6">
                            <label for="fullnameInput" class="form-label">Date</label>
                            <input type="date" class="form-control" id="" placeholder="">
                        </div>
                        <div class="col-lg-6">
                            <label for="formFileMultiple" class="form-label">Files</label>
                            <input class="form-control" type="file" id="formFileMultiple" multiple>
                        </div>
                        <div class="col-lg-12">
                            <label for="formFileMultiple" class="form-label">Description</label>
                            <textarea class="form-control"></textarea>
                        </div>
                        <div class="col-12">
                            <div class="text-end">
                                <button type="submit" class="btn btn-primary">SUBMIT</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script src="{{ URL::asset('2_AdminPanel/js/app.js') }}"></script>
    <script src="{{ URL::asset('2_AdminPanel/js/app.js') }}"></script>
    <script src="{{ URL::asset('2_AdminPanel/libs//@ckeditor/ckeditor5-build-classic/2_AdminPanel/css/ckeditor.js') }}"></script>
    <script src="{{ URL::asset('2_AdminPanel/libs//quill/quill.min.js') }}"></script>
    <script src="{{ URL::asset('2_AdminPanel/js/pages/form-editor.init.js') }}"></script>
    <script src="{{ URL::asset('2_AdminPanel/js/app.js') }}"></script>
@endsection
