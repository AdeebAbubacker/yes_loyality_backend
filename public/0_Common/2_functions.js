$(document).ready(function () { });

// function SetCookie(CookieName, CookieValue, ExpiryInDays = 1) {
//     let date = new Date();

//     let domain = (new URL(window.location.origin));
//     let hostname = domain.hostname;
//     let protocol = domain.protocol;

//     domain = protocol + "//" + hostname + "/";

//     date.setTime(date.getTime() + ExpiryInDays * 24 * 60 * 60 * 1000);

//     document.cookie = `${CookieName}=${CookieValue};
//     domain=${domain};
//     expires=${date.toUTCString()};
//     path=/`;

//     // let expires = "expires=" + d.toUTCString();
//     // document.cookie = CookieName + "=" + CookieValue + ";" + expires + ";path=/";
// }

function setCookie(name, value, days) {
    // alert('==')
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

// Example usage:
setCookie('navbar_size', 'sm', 1);


function DeleteCookie(CookieName) {
    document.cookie = CookieName + "=" + null + ";max-age=0;path=/";
}

function GetCookie(CookieName) {
    let name = CookieName + "=";
    let ca = document.cookie.split(";");
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == " ") {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return false;
}

$.ajaxSetup({
    type: "POST",
    contentType: "application/x-www-form-urlencoded",
    headers: {
        "X-CSRF-Token": $("meta[name=csrf-token]").attr("content"),
    },
});

jQuery.validator.setDefaults({
    debug: false,
    ignore: ":hidden:not([class~=selectized], [data-choices], [name=full_phone1],[name=full_phone],[name=full_phone2]), :hidden > .selectized, .selectize-control .selectize-input input",
    onkeyup: false,
    errorPlacement: function (error, element) {
        console.log(element);
        if (element.is(":radio") || element.is(":checkbox")) {
            error.insertBefore(element.next());
        }
        else if (element.is("select.selectized")) {
            // error.insertAfter(element.next(".selectize-control"));
            element.closest(".form-group-parent").append(error);
        }
        else if (element.is("select.choices__input")) {
            error.insertAfter(element.closest(".choices"));
        }
        else if (element.attr("name") == "full_phone1") {
            error.insertAfter(".phone_1");

        }
        else if (element.attr("name") == "full_phone2") {
            error.insertAfter(".phone_2");

        }
        else if (element.attr("name") == "full_phone") {
            error.insertAfter(".phone");

        }
        else {
            error.insertAfter(element);
        }
    },
    // submitHandler: function (form) {
    // // alert('valid form submitted'); // for demo
    // // return false; // for demo
    // var $this = $(form);
    // var form_id = $this.attr("id");
    // var validator = validatorSettings[form_id] ?? false;

    // if (validator) {
    //     var url = validator.url ?? $this.attr("action"),
    //         defaultButton = validator.defaultButton,
    //         onClickButton = validator.onClickButton,
    //         successFunction = validator.successFunction ?? "",
    //         ajaxSubmit = validator.ajaxSubmit ?? 1,
    //         // failureFunction = validator.failureFunction ?? "",
    //         errorMsg = "";
    // } else {
    //     var url = $this.attr("action"),
    //         defaultButton = "SUBMIT",
    //         onClickButton = "",
    //         successFunction = "",
    //         ajaxSubmit = 1,
    //         // failureFunction = validator.failureFunction ?? "",
    //         errorMsg = "";
    // }

    // var submitType = $this.attr("method") ?? "";

    // // if (onClickButton != "" && defaultButton != "")
    // $this.find("button[type='submit']").html(onClickButton);
    // $this.find("button[type='submit']").attr("disabled", true);

    // var formData = new FormData($(form)[0]);
    // // var formData = $this.serialize();

    // if (!ajaxSubmit) {
    //     form.submit();
    //     return false;
    // }

    // $.ajax({
    //     url: url,
    //     data: formData,
    //     method: submitType,
    //     processData: false,
    //     contentType: false,
    //     success: function (response) {
    //         // if (onClickButton != "" && defaultButton != "")
    //         $this.find("button[type='submit']").html(defaultButton);
    //         $this.find("button[type='submit']").attr("disabled", false);

    //         if (
    //             successFunction != "" &&
    //             typeof cyberfort[successFunction] !== "undefined" &&
    //             typeof cyberfort[successFunction] === "function"
    //         ) {
    //             cyberfort[successFunction](response, form);
    //         }

    //         if (
    //             typeof ApiCallback[form_id] !== "undefined" &&
    //             typeof ApiCallback[form_id] === "function"
    //         ) {
    //             ApiCallback[form_id](response, form);
    //         }
    //     },
    //     error: function (jqXHR, textStatus, errorThrown) {
    //         var responseText = jQuery.parseJSON(jqXHR.responseText);

    //         if (responseText.message == "CSRF token mismatch.") {
    //             alert("Session Timed Out! Reloading..");

    //             location.reload();
    //             return false;
    //         }

    //         alert(errorThrown);
    //         // alert("Network Error");
    //         // console.log(jqXHR.responseText);
    //         // console.log(jqXHR.statusText);

    //         console.log(textStatus);
    //         console.log(errorThrown);

    //         $this.find("button[type='submit']").html("Try Again!").attr("disabled", false);
    //     },
    // });
    // },
});


$.validator.addMethod(
    "mobile_num",
    function (value, element) {
        var re = new RegExp(
            "^(?:(?:\\()(?:\\+|0{0,2})91(?:\\))(\\s*[\\ -]\\s*)?|[0]?)?[6789]\\d|( )|(-){9}|(\\d[ -]?){10}\\d$"
        );
        return this.optional(element) || re.test(value);
    },
    "Invalid Mobile!"
); // mobile_num

$.validator.addMethod(
    "is_aadhaar",
    function (value, element) {
        var re = new RegExp("^[2-9]{1}[0-9]{3}\\s*[0-9]{4}\\s*[0-9]{4}$");
        return this.optional(element) || re.test(value);
    },
    "Invalid Aadhaar Number!"
); // is_aadhaar

$.validator.addMethod(
    "indian_pin",
    function (value, element) {
        var re = new RegExp("^[1-9][0-9]{2}\\s*[0-9]{3}$");
        return this.optional(element) || re.test(value);
    },
    "Invalid Pin Code!"
); // indian_pin

$.validator.addMethod(
    "minDateToday",
    function (value, element) {
        var curDate = new Date().setHours(0, 0, 0, 0);
        console.log(curDate);
        console.log(value);

        // var inputDate = value.split("-").reverse().join("-");
        // console.log(inputDate);
        inputDate = new Date(value).setHours(0, 0, 0, 0);
        console.log(inputDate);

        if (inputDate < curDate) return false;

        return true;
    },
    "Date cannot be in the past!"
); // minDateToday

$.validator.addMethod(
    "maxDateToday",
    function (value, element) {
        var curDate = new Date().setHours(0, 0, 0, 0);;
        var inputDate = value.split("-").reverse().join("-");
        inputDate = new Date(value).setHours(0, 0, 0, 0);;

        if (inputDate > curDate) return false;

        return true;
    },
    "Date cannot be in the future!"
); // maxDateToday

$.validator.addMethod(
    "max5DaysPast",
    function (value, element) {
        var curDate = new Date();
        var maxDate = curDate.setDate(curDate.getDate() - 6);
        var inputDate = value.split("-").reverse().join("-");
        inputDate = new Date(value);

        if (inputDate < maxDate) return false;

        return true;
    },
    "Date should be max 5 Days old!"
);

// max5DaysPast
$.validator.addMethod(
    "dateRange_5_5",
    function (value, element) {
        var curDate = new Date();
        var minDate = curDate.setDate(curDate.getDate() - 6);
        var maxDate = curDate.setDate(curDate.getDate() + 6);
        var inputDate = new Date(value);

        if (inputDate < minDate || inputDate > maxDate) return false;

        return true;
    },
    "Invalid Date!"
);

$.validator.addMethod(
    "alphabets_only",
    function (value, element) {
        var re = new RegExp("^[A-Za-z ]+$");
        return this.optional(element) || re.test(value);
    },
    "Only Alphabets are allowed here!"
); // Only Letters

$.validator.addMethod(
    "NeedCharacters",
    function (value, element) {
        var re = new RegExp("[A-Za-z0-9]");
        return this.optional(element) || re.test(value);
    },
    "Input atleast one character!"
);

$.validator.addMethod(
    "IsEmail",
    function (value, element) {
        var re = new RegExp(
            // "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]]"
            // ^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]
            // "^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,}$"
            // "/^[a-zA-Z0-9._]+@[a-zA-Z0-9_-]+\.[a-zA-Z]{2,}(?:\.[a-zA-Z]{2,})?$/g"
            "^[a-zA-Z0-9._]+@[a-zA-Z0-9_-]+\.[a-zA-Z]{2,}(?:\.[a-zA-Z]{2,})?$"
        );
        return this.optional(element) || re.test(value);
    },
    "please enter a valid email address!"
);

$.validator.addMethod(
    "username",
    function (value, element) {
        var re = new RegExp("/^W+$/");
        return this.optional(element) || re.test(value);
    },
    "Invalid Username!"
); // Username

$.validator.addMethod(
    "no_space",
    function (value, element) {
        return value.indexOf(" ") < 0 && value != "";
    },
    "No space allowed!"
); // error message

$.validator.addMethod("IsPassword", function (value) {
    return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
        && /[a-z]/.test(value) // has a lowercase letter
        && /\d/.test(value) // has a digit
}, "Password must contain atleast 6 characters; uppercase, lowercase, & special characters including numbers");


$.validator.addMethod("exactSize", function (value, element, param) {
    var width = param[0];
    var height = param[1];

    if (element.files && element.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var img = new Image();
            img.onload = function () {
                var imageWidth = this.width;
                var imageHeight = this.height;

                if (imageWidth == width && imageHeight == height) {
                    // Image has the exact size required
                    return true;
                } else {
                    // Image does not have the exact size required
                    return false;
                }
            };
            img.src = e.target.result;
        };
        reader.readAsDataURL(element.files[0]);
    }
}, "The image dimensions must be exactly {0}x{1} pixels.");

$.validator.addMethod("greaterThan", function (value, element) {
    var today = new Date();
    var inputDate = new Date(value);

    return inputDate > today;
},
    'Must be greater than {0}.'
);

$.validator.addMethod(
    "IsDate",
    function (value, element) {
        var check = false;

        var re = new RegExp("/^\d{1,2}\-\d{1,2}\-\d{4}$/");
        if (re.test(value)) {
            var adata = value.split('-');
            var dd = parseInt(adata[0], 10);
            var mm = parseInt(adata[1], 10);
            var yyyy = parseInt(adata[2], 10);
            var xdata = new Date(yyyy, mm - 1, dd);
            if ((xdata.getFullYear() === yyyy) && (xdata.getMonth() === mm - 1) && (xdata.getDate() === dd)) {
                check = true;
            }
            else {
                check = false;
            }
        } else {
            check = false;
        }
        return this.optional(element) || check;
    },
    "Wrong date format"
);

$.validator.addMethod("dateLesserThan",
    function (value, element, params) {

        if (!$(element).val() || !$(params).val())
            return true;

        if (!/Invalid|NaN/.test(new Date(value))) {
            return new Date(value) < new Date($(params).val());
        }

        return isNaN(value) && isNaN($(params).val())
            || (Number(value) < Number($(params).val()));
    },
    'Must be greater than {0}.'
);

$.validator.addMethod("dateGreaterThan",
    function (value, element, params) {

        if (!$(element).val() || !$(params).val())
            return true;

        if (!/Invalid|NaN/.test(new Date(value))) {
            return new Date(value) > new Date($(params).val());
        }

        return isNaN(value) && isNaN($(params).val())
            || (Number(value) > Number($(params).val()));
    },
    'Must be greater than {0}.'
);

$.validator.addMethod("dateLesserThanVal",
    function (value, element, params) {

        if (!params)
            return true;

        if (!/Invalid|NaN/.test(new Date(value))) {
            return new Date(value) < new Date(params);
        }

        return isNaN(value) && isNaN(params)
            || (Number(value) < Number(params));
    },
    'Must be greater than {0}.'
);

$.validator.addMethod("dateGreaterThanVal",
    function (value, element, params) {

        if (!params)
            return true;

        if (!/Invalid|NaN/.test(new Date(value))) {
            return new Date(value) > new Date(params);
        }

        return isNaN(value) && isNaN(params)
            || (Number(value) > Number(params));
    },
    'Must be greater than {0}.'
);

$.validator.addMethod("dateGreaterThanToday", function (value, element) {
    if (!value) {
        return false; // if no date is provided, validation fails
    }

    // Parse the input date
    var inputDate = new Date(value);

    // Get the current date
    var currentDate = new Date();

    // Set the time of the current date to midnight (00:00:00) to ignore time differences
    currentDate.setHours(0, 0, 0, 0);

    // Return true if the input date is greater than the current date
    return inputDate > currentDate;
}, 'The date is Expired. Please choose valid date.');





function AjaxApi(options) {

    var settings = $.extend(
        {
            // These are the defaults.
            Url: "",
            Method: "GET",
            FormData: {},
            Headers: {},
            DataType: "",
            Button: {
                Target: "",
                Default: "",
                OnClick: "",
                Success: "",
                Failure: "",
            },
            Functions: {
                Init: (response) => { },
                Success: (response) => { },
                Failure: (response) => { },
            },

        },
        options
    );

    var Url = settings.Url;
    var Method = settings.Method ?? "GET";
    var FormData = settings.FormData ?? {};
    var Headers = settings.Headers ?? {};
    var DataType = settings.DataType ?? "";
    var Button = settings.Button.Target ?? "";
    var DefaultButton = settings.Button.Default ?? "";
    var OnClickButton = settings.Button.OnClick ?? "";
    var SuccessButton = settings.Button.Success ?? DefaultButton ?? "Success!";
    var FailureButton = settings.Button.Failure ?? DefaultButton ?? "Try Again!";

    if (!Url || Url == "") {
        console.error(`AjaxApi url cannot be empty: ${Url}`)
        return false;
    }

    var Functions = settings.Functions;

    var ButtonId = "";

    if (Button != "") {
        Button.html(OnClickButton).attr("disabled", true);
        ButtonId = Button.attr("id");
    }

    if (
        Functions.Init &&
        typeof Functions.Init !== "undefined" &&
        typeof Functions.Init === "function"
    ) {
        var InitSettings = delete settings.Functions;
        Functions.Init(InitSettings);
    }

    if (DataType == "JSON") {
        Headers["Content"] = "application/json";
        // { "Content-Type": "multipart/form-data" }
    }

    axios({
        method: Method,
        url: Url,
        data: FormData,
        headers: Headers,
    })
        .then(function (response) {
            if (Button != "") {
                Button.html(SuccessButton).attr("disabled", false);
            }

            if (
                Functions.Success &&
                typeof Functions.Success !== "undefined" &&
                typeof Functions.Success === "function"
            ) {
                Functions.Success(response);
            }
        })
        .catch(function (response) {
            //handle error

            //   var responseText = jQuery.parseJSON(jqXHR.responseText);

            //   if (responseText.message == "CSRF token mismatch.") {
            //       alert("Session Timed Out! Reloading..");

            //       location.reload();
            //       return false;
            //   }

            //   alert(errorThrown);
            //   // alert("Network Error");

            //   // console.log(jqXHR.responseText);
            //   // console.log(jqXHR.statusText);

            //   console.log(textStatus);
            //   console.log(errorThrown);

            console.log(response);

            if (Button != "") {
                Button.html(FailureButton).attr("disabled", false);
            }

            if (
                Functions.Failure &&
                typeof Functions.Failure !== "undefined" &&
                typeof Functions.Failure === "function"
            ) {
                Functions.Failure(response);
            }
        });

    // $.ajax({
    //     url: Url,
    //     data: FormData,
    //     dataType: DataType,
    //     method: Method,
    //     success: function (response) {
    //         if (Button != "") {
    //             Button.html(SuccessButton).attr("disabled", false);
    //         }

    //         if (
    //             Functions.Success &&
    //             typeof Functions.Success !== "undefined" &&
    //             typeof Functions.Success === "function"
    //         ) {
    //             Functions.Success(response);
    //         }
    //     },
    //     error: function (jqXHR, textStatus, errorThrown) {
    //         var responseText = jQuery.parseJSON(jqXHR.responseText);

    //         if (responseText.message == "CSRF token mismatch.") {
    //             alert("Session Timed Out! Reloading..");

    //             location.reload();
    //             return false;
    //         }

    //         alert(errorThrown);
    //         // alert("Network Error");

    //         // console.log(jqXHR.responseText);
    //         // console.log(jqXHR.statusText);

    //         console.log(textStatus);
    //         console.log(errorThrown);

    //         if (Button != "") {
    //             Button.html(FailureButton).attr("disabled", false);
    //         }

    //         if (
    //             Functions.Failure &&
    //             typeof Functions.Failure !== "undefined" &&
    //             typeof Functions.Failure === "function"
    //         ) {
    //             Functions.Failure(jqXHR, textStatus, errorThrown);
    //         }
    //     },
    // });
}

function OpenModel(options) {

    var settings = $.extend(
        {
            // These are the defaults.
            Data: "",
            Method: "GET",
            IsUrl: 1,
            Title: "Common Model",
            Size: "Medium",
            Action: "Open", // Open / Refresh
            FormData: {},
            Functions: {
                Init: (response) => { },
                Success: (response) => { },
                Failure: (response) => { },
            },

        },
        options
    );

    var Data = settings.Data;
    var Method = settings.Method ?? "GET";
    var IsUrl = settings.IsUrl ?? 1;
    var Title = settings.Title ?? "Common Model";
    var Size = settings.Size ?? "Medium";
    var Action = settings.Action ?? "Open";
    var FormData = settings.FormData ?? {};

    var Model = $("#CommonModel");
    var ModelLabel = Model.find("#CommonModelLabel");
    var ModalDialog = Model.find("#ModalDialog");
    var ModelBody = Model.find("#CommonModelBody");

    if (!["Open", "Refresh"].includes(Action)) {
        console.error(`Invalid Action!`);
        return false;
    }

    if (Action == "Open") {
        if (Size == "") {
            Size = "";
        }
        else {
            Size = Size.toLowerCase();
            Size = ` modal-${Size}`;
        }

        ModalDialog.removeClass("modal-dialog modal-sm modal-lg").addClass(`modal-dialog${Size}`);
    }

    if (!Data || Data == "") {
        IsUrl ?
            console.error(`AjaxApi url cannot be empty!`) :
            console.error(`Model Data cannot be empty!`);

        return false;
    }

    var Functions = settings.Functions;

    if (
        Functions.Init &&
        typeof Functions.Init !== "undefined" &&
        typeof Functions.Init === "function"
    ) {
        var InitSettings = delete settings.Functions;
        Functions.Init(InitSettings);
    }

    if (!IsUrl) {
        if (Action == "Open" || Title != "Common Model") {
            ModelLabel.html(Title);
        }

        ModelBody.html(Data);

        if (Action == "Open") {
            Model.modal("show");
        }

        if (
            Functions.Success &&
            typeof Functions.Success !== "undefined" &&
            typeof Functions.Success === "function"
        ) {
            Functions.Success(response);
        }

        return true;
    }
    if (IsUrl) {
        AjaxApi({
            Url: Data,
            FormData: FormData,
            DataType: "JSON",
            Method: Method,
            Functions: {
                Success: (response) => {
                    var RespData = response.data.data;
                    if (Action == "Open" || Title != "Common Model") {
                        ModelLabel.html(Title);
                    }

                    ModelBody.html(RespData);

                    if (Action == "Open") {
                        Model.modal("show");
                    }

                    if (
                        Functions.Success &&
                        typeof Functions.Success !== "undefined" &&
                        typeof Functions.Success === "function"
                    ) {
                        Functions.Success(response);
                    }
                },
            },
        })
    }
}





if (GetCookie("HasPageAlert") == "true") {
    function ShowPageMessageAfterReload() {
        var AlertMessage = GetCookie("AlertMessage");
        var MessageBox = GetCookie("MessageBox");
        var MessageType = GetCookie("MessageType");

        ShowPageMessage(AlertMessage, MessageType, MessageBox);

        DeleteCookie("HasPageAlert");
        DeleteCookie("AlertMessage");
        DeleteCookie("MessageBox");
        DeleteCookie("MessageType");
    }

    ShowPageMessageAfterReload();
}

// ShowPageMessage("Messagxsxsxsxe", "success", "#FullPageMessage")

function ShowPageMessage(Message, Type, Location = "#FullPageMessage") {

    $(Location)
        .hide()
        .html(Message)
        .removeClass(function (index, className) {
            return (className.match(/(^|\s)alert-\S+/g) || []).join(' ');
        })
        .addClass(`alert-${Type}`)
        .show();
}

// ========== DO NOT MODIFY ABOVE ========== //

function nl2br(str, is_xhtml) {
    var breakTag =
        is_xhtml || typeof is_xhtml === "undefined" ? "<br />" : "<br>";
    return (str + "").replace(
        /([^>\r\n]?)(\r\n|\n\r|\r|\n)/g,
        "$1" + breakTag + "$2"
    );
}

function nl2nl(str) {
    return (str + "").replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, "$1\n$2");
}

$("body").on("click", ".clipboardCopy", function () {
    var text = $(this).val();
    copy_to_clipboard(text);
    $(this).select();

    alert("User Code Copied!");
});

function copy_to_clipboard(text) {
    var emptyArea = document.createElement("TEXTAREA");
    emptyArea.innerHTML = text;
    document.body.appendChild(emptyArea);

    emptyArea.select();
    document.execCommand("copy");

    document.body.removeChild(emptyArea);
}

function inactive_log(max_inactive_secs = 300) {
    var time,
        interval,
        max_inactive = max_inactive_secs * 1000; // 1000 milliseconds = 1 second

    function logout() {
        window.location.replace("/logout");
    }

    function resetTimer() {
        clearTimeout(time);
        clearInterval(interval);

        var tick = 1000,
            curPercentVal = 100,
            offset = curPercentVal / max_inactive_secs;

        time = setTimeout(logout, max_inactive);

        interval = setInterval(() => {
            curPercentVal = curPercentVal - offset;
            document.querySelector("#countdown").style.width =
                curPercentVal + "%";
        }, tick);
    }

    var events = [
        "load",
        "mousedown",
        "mousemove",
        "keypress",
        "scroll",
        "touchstart",
    ];

    events.forEach(function (name) {
        document.addEventListener(name, resetTimer, true);
    });
}

if ($("#countdown").length) {
    inactive_log(settings.inactive_timeout);
}

function handlePaste(e) {
    var clipboardData, pastedData;

    // Stop data actually being pasted into div
    e.stopPropagation();
    e.preventDefault();

    // Get pasted data via clipboard API
    clipboardData =
        e.originalEvent.clipboardData || window.originalEvent.clipboardData;
    pastedData = clipboardData.getData("Text");

    // Do whatever with pasteddata
    return pastedData;
}

function notify(icon, title, message, type = "success", timeout_sec = "") {
    if (icon == "check") {
        icon == "fi fi-check";
    } else if (icon == "cross") {
        icon == "fi-cross";
    }

    if (timeout_sec == "") {
        timeout_sec = "10000";
    } else {
        timeout_sec = timeout_sec * 1000;
    }

    $.notify(
        {
            icon: icon,
            title: title,
            message: message,
        },
        {
            element: "body",
            position: null,
            type: type,
            allow_dismiss: true,
            newest_on_top: true,
            showProgressbar: true,
            placement: {
                from: "top",
                align: "right",
            },
            offset: 20,
            spacing: 10,
            z_index: 99999999,
            delay: timeout_sec,
            animate: {
                enter: "animated fadeInDown",
                exit: "animated fadeOutUp",
            },
            icon_type: "class",
            template:
                '<div data-notify="container" class="notify-alert col-11 col-sm-3 alert alert-{0}" role="alert">' +
                '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
                '<span class="notify-icon" data-notify="icon"></span> ' +
                '<span class="notify-title" data-notify="title">{1}</span> ' +
                '<span class="notify-message" data-notify="message">{2}</span>' +
                '<div class="notify-progressbar progress" data-notify="progressbar">' +
                '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
                "</div>" +
                '<a href="{3}" target="{4}" data-notify="url"></a>' +
                "</div>",
        }
    );
}

function isInViewport(el) {
    const rect = el.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <=
        (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <=
        (window.innerWidth || document.documentElement.clientWidth)
    );
}

function debug(data) {
    console.log(data);
    return false;
}

function print(data) {
    console.log(data);
}

function AlertMessage(data = "") {
    alert(data);
};

function getUrlParams(Param = "") {
    var PageURL = window.location.search.substring(1),
        URLVariables = PageURL.split("&"),
        ParameterName,
        HasParam = 0,
        AllParams = {},
        i;

    for (i = 0; i < URLVariables.length; i++) {
        ParameterName = URLVariables[i].split("=");

        if (Param !== "") {
            if (ParameterName[0] === Param) {
                HasParam = 1;

                return ParameterName[1] === undefined
                    ? ""
                    : decodeURIComponent(ParameterName[1]);
            }
        } else {
            if (ParameterName[0] == "") return {};

            AllParams[ParameterName[0]] = decodeURIComponent(ParameterName[1]);
        }
    }
    if (Param !== "" && !HasParam)
        return false;

    return AllParams;
}


function generateSlug(str) {
    return str
        .toLowerCase() // Convert the string to lowercase
        .replace(/\s+/g, '-') // Replace spaces with hyphens
        .replace(/[^\w-]+/g, '-') // Remove all non-word characters (excluding hyphens)
        .replace(/--+/g, '-') // Replace multiple hyphens with a single hyphen
        .replace(/^-+/, '-') // Remove leading hyphens
        .replace(/-+$/, '-'); // Remove trailing hyphens
}

function QuillEditor(EditorSelector, ContentId) {
    var Editor = document.getElementById(EditorSelector);
    console.log(EditorSelector)

    if (Editor) {
        var EditorData = {
            'theme': 'snow',
            'modules': {
                'toolbar': [
                    [{
                        'font': []
                    }, {
                        'size': []
                    }],
                    ['bold', 'italic', 'underline', 'strike'],
                    [{
                        'color': []
                    }, {
                        'background': []
                    }],
                    [{
                        'script': 'super'
                    }, {
                        'script': 'sub'
                    }],
                    [{
                        'header': [false, 1, 2, 3, 4, 5, 6]
                    }, 'blockquote', 'code-block'],
                    [{
                        'list': 'ordered'
                    }, {
                        'list': 'bullet'
                    }, {
                        'indent': '-1'
                    }, {
                        'indent': '+1'
                    }],
                    ['direction', {
                        'align': []
                    }],
                    ['link', 'image', 'video'],
                    ['clean']
                ]
            }
        };

        var quill = new Quill(Editor, EditorData);

        quill.on('text-change', function (delta, oldDelta, source) {
            var htmlContent = Editor.querySelector('.ql-editor').innerHTML;
            document.getElementById(ContentId).value = htmlContent;
        });

    }

}


document.getElementById('dark-mode-button').addEventListener('click', function () {

    var htmlElement = document.querySelector('html');
    var userId = htmlElement.getAttribute('data-user-id');
    var modeType = htmlElement.getAttribute('data-layout-mode')
    console.log(modeType)
    console.log(userId)

    axios({
        method: 'post',
        url: '/admin/users/mode',
        data: {
            id: userId,
            mode: modeType
        }
    })
        .then(response => {

        })

});


$.validator.addMethod("phoneInternational", function (value, element) {
    return this.optional(element) || /^\+[1-9]\d{10,14}$/.test(value);
}, "Please enter a valid phone number");


// function country_code() {
//     const input = document.querySelector("#phone");
//     const message = document.querySelector("#full_phone-error");

//     const iti = window.intlTelInput(input, {
//         initialCountry: "au",
//         strictMode: true,
//         hiddenInput: () => ({ phone: "full_phone", country: "country_code" }),
//         utilsScript: "https://cdn.jsdelivr.net/npm/intl-tel-input@23.0.4/build/js/utils.js",
//     });

//     input.addEventListener('input', function () {
//         message.innerHTML = "";
//         if (!iti.isValidNumber()) {
//             message.innerHTML = "Please enter a valid number";
//             return false;
//         }
//     });
//     input.addEventListener('countrychange', function () {
//         input.value = ""; 
//         message.innerHTML = ""; 
//     });
// }

function country_code(id, name) {
    const input = document.querySelector(`#${id}`);
    const message = document.querySelector(`#${id}-error`);
    // const Form = document.querySelector(`#CommonForm`);


    const iti = window.intlTelInput(input, {
        initialCountry: "au",
        strictMode: true,
        separateDialCode: true,
        allowMobileNumbersOnly: true,
        hiddenInput: () => ({ phone: `${name}`, country: "country_code" }),
        utilsScript: "https://cdn.jsdelivr.net/npm/intl-tel-input@23.0.4/build/js/utils.js",
    });

    input.addEventListener('input', function () {
        message.innerHTML = "";
        if (!iti.isValidNumber()) {
            message.innerHTML = "Please enter a valid number";
            return false;
        }
    });
    input.addEventListener('countrychange', function () {
        input.value = "";
        message.innerHTML = "";
    });

    // Form.addEventListener('submit', (Event) => {
    //     Event.preventDefault();
    //     if (!iti.isValidNumber()) {
    //         message.innerHTML = "Please enter a valid number";
    //         return false;
    //     }
    // })

}

let newTab = null;

// Function to handle link clicks
function openInNewTab(event) {
    event.preventDefault(); // Prevent the default link behavior
    const url = event.target.href;

    // Check if the tab is already open
    if (newTab === null || newTab.closed) {
        // Open a new tab if it's not already open
        newTab = window.open(url, '_blank');
    } else {
        // Reuse the existing tab
        newTab.location.href = url;
    }

    // Focus on the new tab
    newTab.focus();
}

// Attach the click event listener to all links with the specified class
document.querySelectorAll('.new-tab-link').forEach(link => {
    link.addEventListener('click', openInNewTab);
});


function formatPhoneNumber(phone_number) {


    try {
        // Parse the phone number in E.164 format
        const phoneNumber = libphonenumber.parsePhoneNumber(phone_number);

        // Format the phone number to international format
        const formattedNumber = phoneNumber.formatInternational();

        // Display the formatted number
        return formattedNumber
    } catch (error) {
        // Handle errors
        return phone_number
    }
}

document.addEventListener('DOMContentLoaded', NoSigns());

function NoSigns() {
    var numberInputs = document.querySelectorAll('input[type="number"]');

    // Restrict certain symbols for all number input fields
    numberInputs.forEach(function (input) {
        const symbolPattern = /[!@#$%^&*()_+\-=\[\]{};':"\\|,<>\/?`~]/;
        input.addEventListener('keydown', function (event) {
            if (symbolPattern.test(event.key)) {
                event.preventDefault();
            }
        });
    });
}


document.addEventListener('DOMContentLoaded', function () {

    axios({
        method: 'get',
        url: '/admin/merchant/fetch_currency',
    })
        .then(response => {
            var data = response.data.data;
            localStorage.setItem('currency', data.value)
        })
});
function formatToTwoDecimalPoints(number) {
    if (isNaN(number)) {
        throw new Error('Input is not a valid number');
    }
    return Number(number).toFixed(2);
}


// document.addEventListener('DOMContentLoaded', function () {

//     var htmlElement = document.querySelector('html');
//     var sideBar = htmlElement.getAttribute('data-sidebar-size');

// });


document.getElementById('topnav-hamburger-icon').addEventListener('click', function () {
    var htmlElement = document.querySelector('html');
    var navbar = htmlElement.getAttribute('data-sidebar-size');

    console.log(navbar);
});