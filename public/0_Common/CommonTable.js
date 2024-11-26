

function AjaxApi(options) {

    var settings = $.extend(
        {
            // These are the defaults.
            Url: "",
            Method: "GET",
            FormData: {},
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


    // axios.get(Url, FormData)
    //     .then(response => {
    //         resolve(response.data);
    //     })
    //     .catch(error => {
    //         console.log(error);
    //     })

    axios({
        method: Method,
        url: Url,
        data: FormData,
        // headers: { "Content-Type": "multipart/form-data" },
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
            Title: "",
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
    var Title = settings.Title;
    var FormData = settings.FormData ?? {};

    var Model = $("#CommonModel");
    var ModelLabel = Model.find("#CommonModelLabel");
    var ModelBody = Model.find("#CommonModelBody");

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
        ModelLabel.html(Title);
        ModelBody.html(Data);
        Model.modal("show");

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
                    var RespData = response.Data;
                    ModelLabel.html(Title);
                    ModelBody.html(RespData);
                    Model.modal("show");

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
