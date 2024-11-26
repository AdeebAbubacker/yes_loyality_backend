@extends('2_AdminPanel.1_Layouts.1_MainLayout')
@section('title') @lang('translation.remix') @endsection
@section('content')
    @component('components.breadcrumb')
        @slot('li_1') Forms @endslot
        @slot('title') Remix Icons @endslot
    @endcomponent
    <div class="row">

    </div><!-- end row -->

    <div class="row">
        <div class="col-12" id="icons"></div> <!-- end col-->
    </div><!-- end row -->
@endsection
@section('script')
    <script src="{{ URL::asset('2_AdminPanel/js/pages/remix-icons-listing.js') }}"></script>
    <script src="{{ URL::asset('2_AdminPanel/js/app.js') }}"></script>
@endsection
