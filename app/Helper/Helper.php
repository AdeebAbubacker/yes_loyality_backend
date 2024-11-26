<?php

use App\Models\Store;
use App\Models\StoreOffer;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Propaganistas\LaravelPhone\PhoneNumber;

function PageHighlight($page)
{
    return (PageName() == $page) ? "active" : "";
}


function PageName(bool $uri = false)
{
    if ($uri)
        return request()->path();
    // return request()->route()->uri;
    else
        return Route::currentRouteName();
}

function GetUrl()
{
    return url()->current();
}

function GetFullUrl()
{
    return request()->route()->uri;
}

function GetShareLink(string $Target = "", string $Link = "")
{
    if ($Link == "")
        $Link = url()->current();

    $Link = urlencode($Link);

    $ShareLinks = [
        "Facebook" => "https://www.facebook.com/sharer/sharer.php?u=$Link",
        "Twitter" => "https://twitter.com/intent/tweet?text=$Link",
        "LinkedIn" => "https://www.linkedin.com/shareArticle?mini=true&url=$Link",
        "Email" => "mailto:?body=$Link",
    ];

    return ($Target == "") ? $ShareLinks : $ShareLinks[$Target];
}

function debug($var, bool $GetType = FALSE)
{
    if ($GetType)
        print_r(gettype($var));
    else
        print_r($var);

    exit;
}

function step($step = 0)
{
    echo $step;
}

function ApiResp($Data = [], $Message = "Completed Succesfully!", $NeedCount = TRUE, $Count = 0, $HasPaginate = FALSE, $Misc = [])
{
    $Data = (object) $Data;

    if ($HasPaginate) {
        $Data = $Data->toArray();
        if (isset($Data["current_page"])) {
            $ArrData = $Data['data'];
            unset($Data['data']);
            $Paginate = $Data;
            $Data = $ArrData;
        }
    }

    $Response = [
        "status" => 1,
        "count" => 0,
        "message" => $Message,
        "data" => $Data,
        "misc" => $Misc,
    ];

    if ($HasPaginate) {
        $Response["paginate"] = $Paginate;
    }

    if ($NeedCount) {
        $Response["count"] = ($Count !== NULL) ? $Count : count($Response["data"]);
    } else {
        unset($Response["count"]);
    }

    return response($Response, 200);
}

function ApiBadResp($Message = "Completed Succesfully!", $Data = [], $Misc = [], $RespCode = 500,)
{
    $Response = [
        "status" => 0,
        "message" => $Message,
        "data" => $Data,
        "misc" => $Misc,
    ];

    return response($Response, 500);
}

function ArrayResp($Data = [], $Message = "Completed Succesfully!", $NeedCount = TRUE, $Count = 0, $Misc = [], $Redirect = NULL)
{
    $Response = [
        "status" => 1,
        "count" => 0,
        "message" => $Message,
        "data" => $Data,
        "misc" => $Misc,
        "redirect" => $Redirect,
    ];

    if ($NeedCount) {
        $Response["count"] = $Count ? $Count : count($Response["data"]);
    } else {
        unset($Response["count"]);
    }

    // return $Response;
    return response($Response, 200);
}

function ArrayBadResp($Message = "Completed Succesfully!", $Data = [], $Misc = [], $RespCode = 500, $Redirect = NULL)
{
    $Response = [
        "status" => 0,
        "message" => $Message,
        "data" => $Data,
        "misc" => $Misc,
        "redirect" => $Redirect,
    ];

    return response($Response, (int)$RespCode);
}

function CheckRespStatus(array $Response): bool
{
    return $Response["status"] ? TRUE : FALSE;
}

function DecodeRespData(array $Response)
{
    return $Response["status"] ?
        response($Response["data"], 200) :
        response($Response["data"], 500);
    // return response($Response["data"]);
}

function DecodeRespMisc(array $Response)
{
    return $Response["status"] ?
        response($Response["misc"], 200) :
        response($Response["misc"], 500);
    // return $Response["misc"];
}

function CheckStat($Response)
{
    if (!isset($Status["status"]))
        return false;

    $Status = $Response["status"] ?? 0;
    $Code = $Response["code"] ?? 0;
    $Status = $Response["status"] ?? 0;
    $Message = $Response["message"] ?? "Sorry.. Something not right!";

    if (!$Status)
        return $Message ?? false;

    return true;
}

function CheckCount($Response)
{
    if (!isset($Status["count"]))
        return true;

    $Count = $Response["count"] ?? 0;

    if (!$Count)
        return "No data found!";

    return $Count;
}

function FetchData($Response)
{
    return $Response["data"] ?? [];
}

function GetData($Response)
{
    $Stat = CheckStat($Response);
    $Count = CheckCount($Response);

    if (!$Stat)
        return $Stat;
    if (!$Count)
        return $Count;

    return FetchData($Response);
}

function AuthCheck()
{
    $User = Auth::user();

    if (!$User) {
        die();
    }

    $UserId = $User->id;
    // $UserImage = $User->image ?? '';

    if ($User->image) {
        $UserImage = asset("FileUploads/UsersImages/$UserId/" . $User->image);

        // if (!file_exists($UserImage)) {
        //     $UserImage = null;
        // }
    } else {
        $UserImage = null;
    }


    // $UserImage = !$UserImage ? "" : "FileUploads/UsersImages/$UserId/$UserImage";

    $UserData = (object) [
        "UserId" => $User->id,
        "UserName" => $User->name,
        "Username" => $User->username,
        "UserEmail" => $User->email,
        "UserPhone" => $User->phone,
        "AgeRange" => $User->age_range,
        "UserImage" => $UserImage,
        "Thumbnail" => "FrontEnd/images/users/avatar-4.jpg",
    ];

    return $UserData;
}

function getFileExistsCheck($media)
{
    $mediaCondition = false;

    if ($media) {
        if ($media->disk == 'public') {
            $mediaCondition = file_exists($media->getPath());
        }
        // else {
        //     $mediaCondition = \Storage::disk($media->disk)->exists($media->getPath());
        // }
    }

    return $mediaCondition;
}


function getAttachments($attchments)
{
    $files = [];
    if (count($attchments) > 0) {
        foreach ($attchments as $attchment) {
            if (getFileExistsCheck($attchment)) {
                array_push($files, $attchment->getFullUrl());
            }
        }
    }

    return $files;
}

function getMediaFileExit($model, $collection = 'profile_image')
{
    if ($model == null) {
        return asset('images/user/user.png');;
    }

    $media = $model->getFirstMedia($collection);

    return getFileExistsCheck($media);
}

function CleanStr($string)
{
    $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.
    $string = preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.

    return preg_replace('/-+/', '-', $string); // Replaces multiple hyphens with single one.
}

function stringLong($str = '', $type = 'title', $length = 0) //Add … if string is too long
{
    if ($length != 0) {
        return strlen($str) > $length ? substr($str, 0, $length) . "..." : $str;
    }
    if ($type == 'desc') {
        return strlen($str) > 150 ? substr($str, 0, 150) . "..." : $str;
    } elseif ($type == 'title') {
        return strlen($str) > 15 ? substr($str, 0, 25) . "..." : $str;
    } else {
        return $str;
    }
}

function dateAgoFormate($date, $type2 = '')
{
    if ($date == null || $date == '0000-00-00 00:00:00') {
        return '-';
    }

    $diff_time1 = \Carbon\Carbon::createFromTimeStamp(strtotime($date))->diffForHumans();
    $datetime = new \DateTime($date);
    $la_time = new \DateTimeZone(Auth::check() ? Auth::user()->time_zone ?? 'UTC' : 'UTC');
    $datetime->setTimezone($la_time);
    $diff_date = $datetime->format('Y-m-d H:i:s');

    $diff_time = \Carbon\Carbon::parse($diff_date)->isoFormat('LLL');

    if ($type2 != '') {
        return $diff_time;
    }

    return $diff_time1 . ' on ' . $diff_time;
}

function timeAgoFormate($date)
{
    if ($date == null) {
        return '-';
    }

    date_default_timezone_set('UTC');

    $diff_time = \Carbon\Carbon::createFromTimeStamp(strtotime($date))->diffForHumans();

    return $diff_time;
}

function ObjToArray($Data)
{
    return json_decode(json_encode($Data), true);
}

function dataFetchLimit($page = 1, $dataLen = 24)
{

    $page = $page < 1 ? 1 : $page; // If page < 1; set page to 1.

    $offset = ($page - 1) * $dataLen;

    return [
        "Offset" => $offset,
        "Limit" => $dataLen
    ];
}

function FormatSizeUnits($bytes)
{
    if ($bytes >= 1073741824) {
        $bytes = number_format($bytes / 1073741824, 2) . ' GB';
    } elseif ($bytes >= 1048576) {
        $bytes = number_format($bytes / 1048576, 2) . ' MB';
    } elseif ($bytes >= 1024) {
        $bytes = number_format($bytes / 1024, 2) . ' KB';
    } elseif ($bytes > 1) {
        $bytes = $bytes . ' bytes';
    } elseif ($bytes == 1) {
        $bytes = $bytes . ' byte';
    } else {
        $bytes = '0 bytes';
    }

    return $bytes;
}

function DeleteEntry($table, $Id, $reason, $IsModel = 1): bool
{
    $ExecStat = FALSE;

    if ($IsModel) {
        $model = "App\Models\\$table";

        $Entry = $model::where('active', 1)->where('id', $Id)->exists();

        if (!$Entry)
            return FALSE;

        $ExecStat = $model::where("id", $Id)
            ->update([
                'active' => '0',
                'deleted_at' => now(),
                'inactive_reason' => $reason
            ]);
    } else {
        $Entry = DB::table($table)->where('active', 1)->where('id', $Id)->exists();

        if (!$Entry)
            return FALSE;

        $ExecStat = DB::table($table)
            ->where('id', $Id)->update(
                [
                    'active' => '0',
                    'deleted_at' => now(),
                    'inactive_reason' => $reason
                ]
            );
    }

    return $ExecStat;
}

function Exists($table, $Condition, $IsModel = 1)
{
    $ExecStat = FALSE;

    if (gettype($Condition) !== "array") {
        $Condition = ["id" => $Condition];
    }

    if ($IsModel) {
        $model = "App\Models\\$table";
        $ExecStat = $model::where($Condition)->first();
    } else {
        $ExecStat = DB::table($table)->where($Condition)->first();
    }

    return $ExecStat;
}

function SelectConfig(array $ColNames, array $NeededCols = [], array $RawQueryCols = []): array
{
    if ($NeededCols == []) {
        foreach ($ColNames as $Key => $val) {
            $NeededCols[$Key] = $Key;
        }
    }


    $SelectCols = [];

    foreach ($NeededCols as $Col => $Alias) {
        if (
            array_key_exists($Col, $ColNames)
        ) {
            $colName = $ColNames[$Col];
            $colName = (in_array($Col, $RawQueryCols)) ?
                DB::raw("$colName AS '$Alias'") :
                "$colName AS $Alias";
            array_push($SelectCols, $colName);
        }
    }

    return $SelectCols;
}

function UploadFiles($files, $path = [])
{

    if ($files == "no_img")
        return false;

    // if (gettype($files) != "array")
    // $files = [$files];

    $image_insert_data = [];

    foreach ($files as $key => $file) {

        $extension = $file->getClientOriginalExtension();
        $FileName = $file->getClientOriginalName();

        $FileName = str_replace(["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "{", "}", "[", "]", ":", ";", "'", '"', "<", ">", ",", ".", "?"], " ", $FileName);

        $filename = rand() . '.' . $FileName . $extension;

        if (empty($path)) {
            $file_upload_stat = $file->storeAs('3_FileUploads/MiscUploads/', $filename);
            // $file->storeAs('public/subfolder', $fileName);
        } elseif (count($path) == 1) {
            $file_upload_stat = $file->storeAs($path[0], $filename);
        } else {

            $file_upload_stat = $file->storeAs($path[$key], $filename);
        }
        // print_r($file_upload_stat); exit;

        if (!$file_upload_stat) {
            return ArrayBadResp(
                Message: "File Upload Error!",
            );
        }
        array_push($image_insert_data, $filename);
    }

    return $image_insert_data;
}

function UploadFiles2($files, $path = [])
{

    if ($files == "no_img")
        return false;

    // if (gettype($files) != "array")
    // $files = [$files];

    $image_insert_data = [];

    foreach ($files as $key => $file) {

        $extension = $file->getClientOriginalExtension();
        $filename = rand() . '.' . $extension;

        if (empty($path)) {
            $file_upload_stat = $file->move('3_FileUploads/MiscUploads/', $filename);
        } elseif (count($path) == 1) {
            $file_upload_stat = $file->move($path[0], $filename);
        } else {
            $file_upload_stat = $file->move($path[$key], $filename);
        }
        // print_r($file_upload_stat); exit;

        if (!$file_upload_stat) {
            return ArrayBadResp(
                Message: "File Upload Error!",
            );
        }
        array_push($image_insert_data, $filename);
    }

    return $image_insert_data;
}
function generateUniqueRandomCode($length)
{
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $codeLength = $length;

    do {
        $randomString = '';
        for ($i = 0; $i < $codeLength; $i++) {
            $index = rand(0, strlen($characters) - 1);
            $randomString .= $characters[$index];
        }
        $codeExists = checkIfCodeExists($randomString);
    } while ($codeExists);

    return $randomString;
}

function checkIfCodeExists($code)
{

    $exist = StoreOffer::where('offer_code', $code)->exists();

    return $exist;
}

function formatPhone($phone)
{
    // if ($phone) {
    //     $phoneNumber = new PhoneNumber($phone);

    //     $phone_no = $phoneNumber->formatInternational();

    //     return $phone_no;
    // } else {
    //     return '';
    // }
    if ($phone) {
        // Assuming the use of the libphonenumber-for-php library
        try {
            $phoneNumber = new PhoneNumber($phone);

            $phone_no = $phoneNumber->formatInternational();

            return $phone_no;
        } catch (\libphonenumber\NumberParseException $e) {
            // Handle the exception as needed
            return $phone;
        }
    } else {
        return '';
    }
}

function convert_date($isoDate)
{
    $dateTime = new DateTime($isoDate, new DateTimeZone('GMT+00:00'));
    $dateTime->setTimezone(new DateTimeZone('Australia/Sydney'));
    $formattedDate = $dateTime->format('F j, Y \a\t h:i:s A');

    return $formattedDate;
}
