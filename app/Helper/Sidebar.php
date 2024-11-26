
<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

function SidebarStructure()
{
    return [
        [
            "Type" => "SectionTitle",
            "Text" => "MENU",
            "TranslateText" => false,
        ],

        [
            "Type" => "List",
            "Text" => "Dashboard",
            "TranslateText" => false,
            "Icon" => "<i class='bx bxs-dashboard'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "Href" => "/admin/dashboard", //route name is not working
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
            "SubMenu" => [],
        ],
        [
            "Type" => "List",
            "Text" => "Loyalty Management",
            "TranslateText" => false,
            "Icon" => "<i class='ri-file-list-3-line'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "Href" => "/admin/transaction/form", //route name is not working
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
        ],
        [
            "Type" => "List",
            "Text" => "Transactions",
            "TranslateText" => false,
            "Icon" => "<i class='bx bx-wallet'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "Href" => "/admin/transaction/list", //route name is not working
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
        ],
        [
            "Type" => "List",
            "Text" => "Users",
            "TranslateText" => false,
            "Icon" => "<i class='bx bx-user-circle'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "HideForRole" => [4, 5],
            "Href" => "/admin/users/list", //route name is not working
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
            "SubMenu" => [],
        ],
        [
            "Type" => "SectionTitle",
            "Text" => "Admin Area",
            "TranslateText" => false,
            "HideForRole" => [4, 5],
        ],

        [
            "Type" => "List",
            "Text" => "Company Profile",
            "TranslateText" => false,
            "Icon" => "<i class='bx bxs-user-rectangle'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "Href" => "/admin/merchant/profile", //route name is not working
            "HideForRole" => [3, 4, 5],
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
            "SubMenu" => [],
        ],
        [
            "Type" => "List",
            "Text" => "Store Profile",
            "TranslateText" => false,
            "Icon" => "<i class='bx bxs-user-rectangle'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "Href" => "/admin/store/profile", //route name is not working
            "HideForRole" => [1, 2, 5],
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
            "SubMenu" => [],
        ],

        [
            "Type" => "List",
            "Text" => "Store",
            "TranslateText" => false,
            "Icon" => "<i class='bx bxs-store'></i>",
            "HasBadge" => false,
            // Optional. Overrides to false if either "BadgeType" or "BadgeText" is missing
            "BadgeType" => "",
            // Optional.
            "BadgeText" => "",
            // Optional.
            "TranslateBadge" => true,
            "ShowForRole" => [],
            "HideForRole" => [3, 4, 5],
            "Href" => "/admin/store/list",
            // Optional. If HasChild is true, this'll be overidden.
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
        ],
        [
            "Type" => "List",
            "Text" => "Rules Configuration",
            "TranslateText" => false,
            "Icon" => "<i class='bx bx-list-ul'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "Href" => "/admin/rules/list", //route name is not working
            "HideForRole" => [5],
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
            "SubMenu" => [],
        ],
        [
            "Type" => "List",
            "Text" => "Loyalty Offers",
            "TranslateText" => false,
            "Icon" => "<i class='bx bxs-offer'></i>",
            "HasBadge" => false,
            "BadgeType" => "",
            "BadgeText" => "",
            "Href" => "/admin/loyality-offer/list", //route name is not working
            "HideForRole" => [4, 5],
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
            "SubMenu" => [],
        ],

        [
            "Type" => "List",
            "Text" => "Store Offers",
            "TranslateText" => false,
            "Icon" => "<i class='bx bxs-gift'></i>",
            "HasBadge" => false,
            // Optional. Overrides to false if either "BadgeType" or "BadgeText" is missing
            "BadgeType" => "",
            // Optional.
            "BadgeText" => "",
            // Optional.
            "TranslateBadge" => true,
            "ShowForRole" => [],
            "HideForRole" => [4, 5],
            "Href" => "/admin/storeOffers/list",
            // Optional. If HasChild is true, this'll be overidden.
            "IsRoute" => false,
            "IsActive" => false,
            "HasChild" => false,
        ],
    ];
}
