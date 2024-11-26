<!-- ========== App Menu ========== -->
<div class="app-menu navbar-menu">
    <!-- LOGO -->
    <div class="navbar-brand-box">
        <!-- Dark Logo-->
        <a href="{{ route('DashboardView') }}" class="logo logo-dark">
            <span class="logo-sm">
                <img src="{{ URL::asset('2_AdminPanel/images//YL-icon.png') }}" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="{{ URL::asset('2_AdminPanel/images//YL-logo.png') }}" alt="" height="17">
            </span>
        </a>
        <!-- Light Logo-->
        <a href="{{ route('DashboardView') }}" class="logo logo-light">
            <span class="logo-sm">
                <img src="{{ URL::asset('2_AdminPanel/images//YL-icon.png') }}" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="{{ URL::asset('2_AdminPanel/images//YL-logo.png') }}" alt="" height="50" width="120">
            </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu">
            </div>
            
            <ul class="navbar-nav" id="navbar-nav">
                @if (1)

                @php
                    $SidebarStructure_1 = SidebarStructure();
                    $User = Auth::user();
                    $UserRole = $User->role_id;
                @endphp

                @foreach ($SidebarStructure_1 as $Entry_1)
                    @php
                        $HideForRole_1 = $Entry_1["HideForRole"] ?? false;
                        $ShowForRole_1 = $Entry_1["ShowForRole"] ?? false;

                        if(
                            ($HideForRole_1 && is_array($HideForRole_1) && in_array($UserRole, $HideForRole_1)) 
                            ||
                             ($ShowForRole_1 && is_array($ShowForRole_1) && !in_array($UserRole, $ShowForRole_1))
                            
                        ) {
                            continue;
                        }

                        $TranslateText_1 = $Entry_1["TranslateText"] ?? false;
                    @endphp

                    @if ($Entry_1["Type"] == "SectionTitle")
                        <li class="menu-title">
                            <span>
                                @if ($TranslateText_1)
                                    @lang($Entry_1["Text"])
                                @else
                                    {{ $Entry_1["Text"] }}
                                @endif
                            </span>
                        </li>
                    @elseif($Entry_1["Type"] == "List")
                        @php
                        $Text_1 = $TranslateText_1 ? __($Entry_1["Text"]) : $Entry_1["Text"];
                        $Text_1 = CleanStr($Text_1);
                        $ActiveMenu_1 = "";

                        if(isset($Entry_1["Href"]) && $Entry_1["Href"] != "") {
                            $IsRoute_1 = $Entry_1["IsRoute"] ?? false;
                            if($IsRoute_1) {
                                $Href_1 = Route($Entry_1["Href"]);
                                $ActiveMenu_1 = ($Entry_1["IsActive"] || $Entry_1["Href"] == PageName()) ? " active" : "";
                            }
                            else {
                                $Href_1 = $Entry_1["Href"];
                                $ActiveMenu_1 = ($Entry_1["IsActive"] || $Entry_1["Href"] == PageName(1)) ? " active" : "";
                            }
                        }
                        else {
                            $Href_1 = "#";
                        }

                        $HasChild_1 = (
                            $Entry_1["HasChild"] && $Entry_1["SubMenu"] && isset($Entry_1["SubMenu"])
                            && is_array($Entry_1["SubMenu"]) && $Entry_1["SubMenu"] != []
                        );

                        $LinkAttr_1 = $HasChild_1 ? " href='#sidebar$Text_1' data-bs-toggle='collapse' role='button' aria-expanded='false' aria-controls='sidebar$Text_1'" : " href='$Href_1'";

                        @endphp

                        <li class="nav-item">
                            <a class="nav-link menu-link{{ $ActiveMenu_1 }}"{!! $LinkAttr_1 !!}>

                                @if (isset($Entry_1["Icon"]) && $Entry_1["Icon"] != "")
                                    {!! $Entry_1["Icon"] !!}
                                @endif

                                <span>
                                    @if ($TranslateText_1)
                                        @lang($Entry_1["Text"])
                                    @else
                                        {!! $Entry_1["Text"] !!}
                                    @endif
                                </span>
                                
                                @if (
                                    isset($Entry_1["HasBadge"]) && $Entry_1["HasBadge"] === true
                                    && isset($Entry_1["BadgeType"]) && $Entry_1["BadgeType"] != ""
                                    && isset($Entry_1["BadgeText"]) && $Entry_1["BadgeText"] != ""
                                )

                                @php
                                $TranslateBadgeText = ($Entry_1["TranslateBadge"]) ? __($Entry_1["BadgeText"]) : $Entry_1["BadgeText"];
                                @endphp

                                <span class="badge badge-pill bg-{{ $Entry_1["BadgeType"] }}">{!! $TranslateBadgeText !!}</span>
                                @endif
                                
                            </a>

                            @if ($HasChild_1)

                            @php
                                $SidebarStructure_2 = $Entry_1["SubMenu"];
                            @endphp

                            <div class="collapse menu-dropdown" id="sidebar{{ $Text_1 }}">
                                <ul class="nav nav-sm flex-column">
                                    {{-- @include('layouts.sidebar-render') --}}
                                    @foreach ($SidebarStructure_2 as $Entry_2)
                                    @php
                                    $HideForRole_2 = $Entry_2["HideForRole"] ?? false;
            
                                    if($HideForRole_2 && is_array($HideForRole_2) && in_array($UserRole, $HideForRole_2)) {
                                        continue;
                                    }
            
                                    $TranslateText_2 = $Entry_2["TranslateText"] ?? false;
                                    $Text_2 = $TranslateText_2 ? __($Entry_2["Text"]) : $Entry_2["Text"];
                                    $Text_2 = CleanStr($Text_2);
                                    $ActiveMenu_2 = "";
                        
                                    if(isset($Entry_2["Href"]) && $Entry_2["Href"] != "") {
                                        $IsRoute_2 = $Entry_2["IsRoute"] ?? false;
                                        if($IsRoute_2) {
                                            $Href_2 = Route($Entry_2["Href"]);
                                            $ActiveMenu_2 = ($Entry_2["IsActive"] || $Entry_2["Href"] == PageName()) ? " active" : "";
                                        }
                                        else {
                                            $Href_2 = $Entry_2["Href"];
                                            $ActiveMenu_2 = ($Entry_2["IsActive"] || $Entry_2["Href"] == PageName(1)) ? " active" : "";
                                        }
                                    }
                                    else {
                                        $Href_2 = "#";
                                    }

                                    $HasChild_2 = (
                                        $Entry_2["HasChild"] && $Entry_2["SubMenu"] && isset($Entry_2["SubMenu"])
                                        && is_array($Entry_2["SubMenu"]) && $Entry_2["SubMenu"] != []
                                    );
            
                                    $LinkAttr_2 = $HasChild_2 ? " href='#sidebar$Text_2' data-bs-toggle='collapse' role='button' aria-expanded='false' aria-controls='sidebar$Text_2'" : " href='$Href_2'";
            
                                    @endphp
                                    <li class="nav-item">
                                        <a class="nav-link{{ $ActiveMenu_2 }}"{!! $LinkAttr_2 !!}>
                                            <span>
                                                @if ($TranslateText_2)
                                                    @lang($Entry_2["Text"])
                                                @else
                                                    {!! $Entry_2["Text"] !!}
                                                @endif
                                            </span>
                                            
                                            @if (
                                                isset($Entry_2["HasBadge"]) && $Entry_2["HasBadge"] === true
                                                && isset($Entry_2["BadgeType"]) && $Entry_2["BadgeType"] != ""
                                                && isset($Entry_2["BadgeText"]) && $Entry_2["BadgeText"] != ""
                                            )
            
                                            @php
                                            $TranslateBadgeText = ($Entry_2["TranslateBadge"]) ? __($Entry_2["BadgeText"]) : $Entry_2["BadgeText"];
                                            @endphp
            
                                            <span class="badge badge-pill bg-{{ $Entry_2["BadgeType"] }}">{!! $TranslateBadgeText !!}</span>
                                            @endif
                                            
                                        </a>
            
                                        @if ($HasChild_2)
            
                                        @php
                                            $SidebarStructure_3 = $Entry_2["SubMenu"];
                                        @endphp
            
                                        <div class="collapse menu-dropdown" id="sidebar{{ $Text_2 }}">
                                            <ul class="nav nav-sm flex-column">
                                                @foreach ($SidebarStructure_3 as $Entry_3)
                                                @php
                                                $HideForRole_3 = $Entry_3["HideForRole"] ?? false;
                        
                                                if($HideForRole_3 && is_array($HideForRole_3) && in_array($UserRole, $HideForRole_3)) {
                                                    continue;
                                                }
                        
                                                $Text_3 = $Entry_3["TranslateText"] ? __($Entry_3["Text"]) : $Entry_3["Text"];
                                                $Text_3 = CleanStr($Text_3);
                                                $ActiveMenu_3 = "";
                        
                                                if(isset($Entry_3["Href"]) && $Entry_3["Href"] != "") {
                                                    $IsRoute_3 = $Entry_3["IsRoute"] ?? false;
                                                    $Href_3 = $IsRoute_3 ? Route($Entry_3["Href"]) : $Entry_3["Href"];
                                                    if($IsRoute_3) {
                                                        $Href_3 = Route($Entry_3["Href"]);
                                                        $ActiveMenu_3 = ($Entry_3["IsActive"] || $Entry_3["Href"] == PageName()) ? " active" : "";
                                                    }
                                                    else {
                                                        $Href_3 = $Entry_3["Href"];
                                                        $ActiveMenu_3 = ($Entry_3["IsActive"] || $Entry_3["Href"] == PageName(1)) ? " active" : "";
                                                    }
                                                }
                                                else {
                                                    $Href_3 = "#";
                                                }

                                                @endphp
                                                <li class="nav-item">
                                                    <a class="nav-link{{ $ActiveMenu_3 }}" href="{{ $Href_3 }}">
                                                        <span>
                                                            @if ($Entry_3["TranslateText"])
                                                                @lang($Entry_3["Text"])
                                                            @else
                                                                {!! $Entry_3["Text"] !!}
                                                            @endif
                                                        </span>
                                                        
                                                        @if (
                                                            isset($Entry_3["HasBadge"]) && $Entry_3["HasBadge"] === true
                                                            && isset($Entry_3["BadgeType"]) && $Entry_3["BadgeType"] != ""
                                                            && isset($Entry_3["BadgeText"]) && $Entry_3["BadgeText"] != ""
                                                        )
                        
                                                        @php
                                                        $TranslateBadgeText = ($Entry_3["TranslateBadge"]) ? __($Entry_3["BadgeText"]) : $Entry_3["BadgeText"];
                                                        @endphp
                        
                                                        <span class="badge badge-pill bg-{{ $Entry_3["BadgeType"] }}">{!! $TranslateBadgeText !!}</span>
                                                        @endif
                                                        
                                                    </a>
                                                </li>
                                                @endforeach
                                            </ul>
                                        </div>
                                            
                                        @endif
                                    </li>
                                    {{-- <li class="nav-item">
                                        <a href="dashboard-analytics" class="nav-link">@lang('translation.analytics')</a>
                                    </li> --}}
                                    @endforeach
                                </ul>
                            </div>
                                
                            @endif
                        </li>
                    @endif
                    
                @endforeach

                @endif

                {{-- <li class="menu-title"><span>@lang('translation.menu')</span></li> --}}

                {{-- <li class="nav-item">
                    <a class="nav-link menu-link" href="widgets">
                        <i class="ri-dashboard-2-line"></i> <span>Dashboard</span>
                    </a>
                </li> --}}
                
                {{-- <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarUserSubmissions" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarUserSubmissions">
                        <i class="ri-dashboard-2-line"></i> <span>User Submissions</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarUserSubmissions">
                        <ul class="nav nav-sm flex-column">
                            <a class="nav-link" href="{{ Route("ContactListView") }}">
                                <i class="ri-dashboard-2-line"></i> <span>Enquiries</span>
                            </a>
                            <a class="nav-link" href="{{ Route("ListView") }}">
                                <i class="ri-dashboard-2-line"></i> <span>Appointments</span>
                            </a>
                        </ul>
                    </div>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarDashboards" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarDashboards">
                        <i class="ri-dashboard-2-line"></i> <span>Blog</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarDashboards">
                        <ul class="nav nav-sm flex-column">
                            <li class="nav-item">
                                <a href="{{ Route("BlogListView") }}" class="nav-link">List All</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ Route("AddBlogFormView") }}" class="nav-link">Create</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ Route("CategoryListView") }}" class="nav-link">Categories</a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ Route("TestimonialListView") }}">
                        <i class="ri-dashboard-2-line"></i> <span>Testimonials</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ Route("NotificationListView") }}">
                        <i class="ri-dashboard-2-line"></i> <span>Notifications</span>
                    </a>
                </li> --}}

            </ul>
        </div>
        <!-- Sidebar -->
    </div>

    {{-- <div class="navbar-version-box">
        <p>V.12.11</p>
    </div> --}}
    <div class="sidebar-background"></div>
</div>
<!-- Left Sidebar End -->
<!-- Vertical Overlay-->
<div class="vertical-overlay"></div>
