@extends('2_AdminPanel.1_Layouts.1_MainLayout')
@section('title') @lang('translation.starter')  @endsection
@section('content')
@component('components.breadcrumb')
@slot('li_1') Pages @endslot
@slot('title') Starter  @endslot
@endcomponent
@endsection
@section('script')
<script src="{{ URL::asset('2_AdminPanel/js/app.js') }}"></script>
@endsection
