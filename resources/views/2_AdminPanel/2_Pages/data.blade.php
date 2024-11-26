@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    @lang('translation.starter')
@endsection

@section('css')
    <link rel="stylesheet" href="{{ URL::asset('2_AdminPanel/libs/gridjs/theme/mermaid.min.css') }}">
@endsection

@section('PageScript')
    Blog
@endsection

@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Pages
        @endslot
        @slot('title')
            Blog
        @endslot
    @endcomponent

    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title mb-0 flex-grow-1">Base Example</h4>
                </div><!-- end card header -->

                <div class="card-body">
                    <div id="table-gridjs"></div>
                </div><!-- end card-body -->
            </div><!-- end card -->
        </div>
        <!-- end col -->
    </div>
@endsection

@section('script')
<script src="{{ URL::asset('2_AdminPanel/libs/gridjs/gridjs.umd.js') }}"></script>
{{-- <script src="{{ URL::asset('2_AdminPanel/VueConfig/PageConfigs/BlogPage.js') }}"></script> --}}
{{-- <script src="{{ URL::asset('2_AdminPanel/js/pages/gridjs.init.js') }}"></script> --}}
<script src="{{ URL::asset('2_AdminPanel/js/app.js') }}"></script>
@endsection
