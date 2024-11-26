<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" data-topbar="light" data-sidebar-image="none">

<head>
    <meta charset="utf-8" />
    <title>@yield('title') | Giridhari Admin Area</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ URL::asset('2_AdminPanel/images/favicon.ico') }}">
    @include('2_AdminPanel.1_Layouts.head-css')
</head>

@yield('body')

@yield('content')

@include('2_AdminPanel.1_Layouts.vendor-scripts')
</body>

</html>
