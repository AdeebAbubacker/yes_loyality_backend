$("body").on("click", ".AddRecord", function () {

    OpenModel({
        // These are the defaults.
        Data: `/admin/merchant/form/add`,
        Method: "POST",
        IsUrl: 1,
        Title: "Add Company Profile",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                country_code('phone_1', 'full_phone1');
                country_code('phone_2', 'full_phone2');
                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,
                        },
                        location: {
                            required: true,
                        },
                        address: {
                            required: true,
                        },
                        coordinates: {
                            required: true,
                        },
                        name_1: {
                            required: true,
                        },
                        name_2: {
                        },
                        phone_1: {
                            required: true,
                        },
                        phone_2: {
                        },
                        currency: {
                            required: true,
                        },
                        email_1: {
                            required: true,
                            email: true,
                            pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                        },
                        email_2: {
                            email: true,
                            pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                        }
                    },
                    messages: {
                        email_1: {
                            pattern: "Please enter a valid email address"
                        },
                        email_2: {
                            pattern: "Please enter a valid email address"
                        },
                    },
                    errorPlacement: function (error, element) {
                        if (element.attr("name") == "role") {
                            error.insertAfter("#role-error");
                        } else {
                            error.insertAfter(element);
                        }
                    }
                });
                document.getElementById('CommonForm').addEventListener('submit', (Event) => {
                    Event.preventDefault();
                    if (!$("#CommonForm").valid())
                        return false;
                    const Form = Event.target;
                    const Data = new FormData(Form);
                    const FormAction = Form.getAttribute("action");
                    const Method = Form.getAttribute("method") ?? "GET";

                    console.log(FormAction)

                    axios({
                        method: Method,
                        url: FormAction,
                        data: Data,
                    })
                        .then(response => {
                            $("#CommonModel").modal("hide");
                            const Toast = Swal.mixin({
                                toast: true,
                                position: "top-end",
                                showConfirmButton: false,
                                timer: 1000,
                                timerProgressBar: true,
                                didOpen: (toast) => {
                                    toast.onmouseenter = Swal.stopTimer;
                                    toast.onmouseleave = Swal.resumeTimer;
                                },
                                didClose: () => {
                                    location.reload();
                                }
                            });
                            Toast.fire({
                                icon: "success",
                                title: "Added successfully"
                            });
                        })
                        .catch(error => {
                            console.log(error.response.data);
                        });
                });

            },
            Failure: (response) => { },
        },
    });
});

$("body").on("click", ".EditRecord", function () {

    OpenModel({
        // These are the defaults.
        Data: `/admin/merchant/form/edit`,
        Method: "POST",
        IsUrl: 1,
        Title: "Edit Company Profile",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                country_code('phone_1', 'full_phone1');
                country_code('phone_2', 'full_phone2');
                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,
                        },
                        location: {
                            required: true,
                        },
                        address: {
                            required: true,
                        },
                        coordinates: {
                            required: true,
                        },
                        name_1: {
                            required: true,
                        },
                        name_2: {
                        },
                        phone_1: {
                            required: true,
                        },
                        phone_2: {
                        },
                        currency: {
                            required: true,
                        },
                        email_1: {
                            required: true,
                            email: true,
                            pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                        },
                        email_2: {
                            email: true,
                            pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                        }
                    },
                    messages: {
                        email_1: {
                            pattern: "Please enter a valid email address"
                        },
                        email_2: {
                            pattern: "Please enter a valid email address"
                        },
                    },
                    errorPlacement: function (error, element) {
                        if (element.attr("name") == "role") {
                            error.insertAfter("#role-error");
                        } else {
                            error.insertAfter(element);
                        }
                    }
                });
                document.getElementById('CommonForm').addEventListener('submit', (Event) => {
                    Event.preventDefault();
                    if (!$("#CommonForm").valid())
                        return false;
                    const Form = Event.target;
                    const Data = new FormData(Form);
                    const FormAction = Form.getAttribute("action");
                    const Method = Form.getAttribute("method") ?? "GET";

                    console.log(FormAction)

                    axios({
                        method: Method,
                        url: FormAction,
                        data: Data,
                    })
                        .then(response => {
                            $("#CommonModel").modal("hide");
                            const Toast = Swal.mixin({
                                toast: true,
                                position: "top-end",
                                showConfirmButton: false,
                                timer: 1000,
                                timerProgressBar: true,
                                didOpen: (toast) => {
                                    toast.onmouseenter = Swal.stopTimer;
                                    toast.onmouseleave = Swal.resumeTimer;
                                },
                                didClose: () => {
                                    location.reload();
                                }
                            });
                            Toast.fire({
                                icon: "success",
                                title: "Edited successfully"
                            });
                        })
                        .catch(error => {
                            console.log(error.response.data);
                        });
                });

            },
            Failure: (response) => { },
        },
    });
});

$("body").on("click", ".DeleteRecord", function () {
    var RecordId = $(this).closest(".Rowctions").attr("data-RowId")
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonClass: 'btn btn-primary w-xs me-2 mt-2',
        cancelButtonClass: 'btn btn-danger w-xs mt-2',
        confirmButtonText: "Yes, delete it!",
        buttonsStyling: false,
        showCloseButton: true
    }).then(function (result) {

        if (result.value) {

            AjaxApi({
                Url: `/admin/merchant/delete`,
                DataType: "JSON",
                Method: "POST",
                Functions: {
                    Success: (response) => {
                        Swal.fire({
                            title: 'Deleted!',
                            text: 'Your file has been deleted.',
                            icon: 'success',
                            confirmButtonClass: 'btn btn-primary w-xs mt-2',
                            buttonsStyling: false,
                            didClose: () => {
                                location.reload();
                            }
                        });
                    },
                },
            })

        }
    });
});