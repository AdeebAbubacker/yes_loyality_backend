$("body").on("click", ".EditRecord", function () {
    var RecordId = document.getElementById('store_id').value;
    // alert(RecordId);

    OpenModel({
        // These are the defaults.
        Data: `/admin/store/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Edit Store",
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
                        key_name: {
                            required: true,
                        },
                        support_name: {
                        },
                        phone_1: {
                            required: true,
                        },
                        phone_2: {
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