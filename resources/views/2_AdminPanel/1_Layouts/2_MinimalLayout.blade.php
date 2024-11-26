<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" data-topbar="light" data-sidebar-image="none">

<head>
    <meta charset="utf-8" />
    {{-- <title>@yield('title') | Giridhari - Admin Section</title> --}}
    <title>@yield('title')Yes Yes Loyalty - Admin Section</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Yes Yes Loyalty - Admin Panel" name="description" />
    <meta content="Agate" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ asset('2_AdminPanel/images//YL-icon.png') }}" type="image/x-icon">
    @include('2_AdminPanel.1_Layouts.head-css')
</head>

@yield('body')

@yield('content')

@include('2_AdminPanel.1_Layouts.vendor-scripts')
</body>

</html>
