@php
    //if (!Auth::check()):
    //    header('Location: ' . route('login'));
    //    exit();
    //endif;
@endphp

<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" data-layout="vertical" data-topbar="light" data-sidebar="dark"
    data-layout-mode="{{ Auth::user()->mode }}" data-user-id="{{ Auth::user()->id }}" data-sidebar-size="lg" data-user-role-id="{{ Auth::user()->role_id }}"
    data-sidebar-image="none" data-preloader="disable">

<head>

    <meta charset="utf-8" />
    <title>@yield('title') - Yes Yes Loyalty - Admin Section</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Yes Yes Loyalty - Admin Section" name="description" />
    <meta content="Agate" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ asset('2_AdminPanel/images//YL-icon.png') }}" type="image/x-icon">

    @include('2_AdminPanel.1_Layouts.head-css')


</head>


<body>
    <!-- Begin page -->
    <div id="layout-wrapper">
        <input id="Auth-user-id" name="auth_user" value="{{ Auth::user()->role_id }}" hidden>

        @include('2_AdminPanel.1_Layouts.topbar')
        @include('2_AdminPanel.1_Layouts.sidebar')
        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    @yield('content')
                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->
            @include('2_AdminPanel.1_Layouts.footer')
        </div>
        <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->

    {{-- @include('2_AdminPanel.1_Layouts.customizer') --}}

    @include('2_AdminPanel.3_Components.CommonModel')

    <!-- JAVASCRIPT -->
    @include('2_AdminPanel.1_Layouts.vendor-scripts')

    @yield('script')

    @yield('script-bottom')



</body>

</html>
