
@php

$SidebarStructure_1 = [
    [
        "Type" => "SectionTitle",
        "Text" => "translation.menu",
        "TranslateText" => true,
    ],
    // [
    //     "Type" => "List",
    //     "Text" => "Dashboard",
    //     "TranslateText" => false,
    //     "Icon" => "<i class='ri-dashboard-2-line'></i>",
    //     "HasBadge" => false,
    //     "BadgeType" => "",
    //     "BadgeText" => "",
    //     "Href" => "DashboardView",
    //     "IsRoute" => true,
    //     "HasChild" => false,
    //     "SubMenu" => [],
    // ],
    [
        "Type" => "List",
        "Text" => "User",
        "TranslateText" => false,
        "Icon" => "<i class='ri-dashboard-2-line'></i>",
        "HasBadge" => false,
        "BadgeType" => "",
        "BadgeText" => "",
        "Href" => "UserListView",
        "IsRoute" => true,
        "HasChild" => false,
        "SubMenu" => [],
    ],
    [
        "Type" => "List",
        "Text" => "User Submissions",
        "TranslateText" => false,
        "Icon" => "<i class='ri-dashboard-2-line'></i>",
        "HasBadge" => false,
        // Optional. Overrides to false if either "BadgeType" or "BadgeText" is missing
        "BadgeType" => "",
        // Optional.
        "BadgeText" => "",
        // Optional.
        "TranslateBadge" => true,
        "Href" => "",
        // Optional. If HasChild is true, this'll be overidden.
        "IsRoute" => true,
        "HasChild" => true,
        "SubMenu" => [
            [
                "Type" => "List",
                "Text" => "Enquiries",
                "TranslateText" => false,
                "HasBadge" => false,
                "BadgeType" => "",
                "BadgeText" => "",
                "TranslateBadge" => true,
                "Href" => "ContactListView",
                "IsRoute" => true,
                "HasChild" => false,
                "SubMenu" => []
            ],
            [
                "Type" => "List",
                "Text" => "Booking",
                "TranslateText" => false,
                "HasBadge" => false,
                "BadgeType" => "",
                "BadgeText" => "",
                "TranslateBadge" => true,
                "Href" => "BookingListView",
                "IsRoute" => true,
                "HasChild" => false,
                "SubMenu" => []
            ],
        ]
    ],
    [
        "Type" => "List",
        "Text" => "Blog",
        "TranslateText" => false,
        "Icon" => "<i class='ri-dashboard-2-line'></i>",
        "HasBadge" => false,
        "BadgeType" => "",
        "BadgeText" => "",
        "Href" => "",
        "IsRoute" => true,
        "HasChild" => true,
        "SubMenu" => [
            [
                "Type" => "List",
                "Text" => "List All",
                "Href" => "BlogListView",
                "IsRoute" => true,
                "HasChild" => false,
                "SubMenu" => []
            ],
            [
                "Type" => "List",
                "Text" => "Create",
                "Href" => "AddBlogFormView",
                "IsRoute" => true,
                "HasChild" => false,
                "SubMenu" => []
            ],
            [
                "Type" => "List",
                "Text" => "Categories",
                "Href" => "CategoryListView",
                "IsRoute" => true,
                "HasChild" => false,
                "SubMenu" => []
            ],
        ],
    ],
    [
        "Type" => "List",
        "Text" => "Module",
        "TranslateText" => false,
        "Icon" => "<i class='ri-dashboard-2-line'></i>",
        "HasBadge" => false,
        "BadgeType" => "",
        "BadgeText" => "",
        "Href" => "ModuleListView",
        "IsRoute" => true,
        "HasChild" => false,
        "SubMenu" => [],
    ],
    [
        "Type" => "List",
        "Text" => "Role",
        "TranslateText" => false,
        "Icon" => "<i class='ri-dashboard-2-line'></i>",
        "HasBadge" => false,
        "BadgeType" => "",
        "BadgeText" => "",
        "Href" => "RoleListView",
        "IsRoute" => true,
        "HasChild" => false,
        "SubMenu" => [],
    ],
    [
        "Type" => "List",
        "Text" => "Notifications",
        "TranslateText" => false,
        "Icon" => "<i class='ri-dashboard-2-line'></i>",
        "HasBadge" => false,
        "BadgeType" => "",
        "BadgeText" => "",
        "Href" => "NotificationListView",
        "IsRoute" => true,
        "HasChild" => false,
        "SubMenu" => [],
    ],
];

@endphp