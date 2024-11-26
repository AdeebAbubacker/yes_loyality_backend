


var CommonTableConfig = null;
var Currency = localStorage.getItem('currency');
var auth_role = document.getElementById('Auth-user-id').value;
// console.log(auth_role)
var hidden = true;
if (auth_role == 1 || auth_role == 2) {
    hidden = true;
} else {
    hidden = false;
}
if (document.getElementById("CommonTable")) {
    CommonTableConfig = new gridjs.Grid({
        pagination: {
            limit: 20,
        },
        sort: true,
        search: true,
        columns: [
            {
                name: "ID",
                hidden: true,
            },
            {
                id: "No",
                name: "No",
                width: "50px",
                formatter: (cell, row) => {
                    return gridjs.html(
                        '<span class="fw-semibold">' + cell + "</span>"
                    );
                },
            },
            {
                id: "MininumAmount",
                name: "Mininum Amount",
                width: "80px",
                formatter: (cell, row) => {
                    return gridjs.html(
                        `${Currency} ${formatToTwoDecimalPoints(cell)}`
                    );
                },
            },
            {
                id: "PointReceived",
                name: "Point Received",
                width: "80px",
            },
            {
                id: "Description",
                name: "Description",
                width: "200px",
                formatter: (cell, row) => {
                    return gridjs.html(
                        cell
                    );
                },
            },
            {
                id: "Qrcodes",
                name: "QR Codes",
                width: "50px",
                sort: false,
                hidden: hidden,
                formatter: (cell, row) => {

                    if (auth_role == 3) {
                        return gridjs.html(
                            `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown QrSection' type='button' data-bs-toggle='dropdown' aria-expanded='false'> <i class='ri-qr-code-line align-middle'></i> </button></div>`
                        );
                    } else {
                        if (cell == null) {
                            return gridjs.html(
                                `<span class="badge badge-soft-danger text-uppercase">Not Available </span>`
                            );
                        } else {
                            return gridjs.html(
                                `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-light btn-sm dropdown' type='button'><a href="data:image/png;base64, ${cell.qr_image}" download="${cell.qr_file}"><img src="data:image/png;base64, ${cell.qr_image}" alt="" class="rounded avatar-sm material-shadow"></a></i> </button>`
                            );
                        }

                    }
                },
            },
            {
                id: "Action",
                name: "Action",
                width: "40px",
                sort: false,

                formatter: (cell, row) => {
                    // console.log(row);
                    // alert(row.cells[0].data);
                    // return gridjs.html(
                    //     `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false'> <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li> <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> </ul></div>`
                    // );
                    if (auth_role == 1 || auth_role == 2) {
                        return gridjs.html(

                            `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false'> <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li> <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> </ul></div>`
                        );
                    } else {
                        return gridjs.html(
                            `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'>
                            <a href='#!' class='dropdown-item link-secondary ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> </a>
                            </div>`
                        );
                    }
                },
            },
        ],
        server: {
            url: '/admin/rules/fetch',
            then: (response) => {
                var data = response.data;
                data = data.map((list, index) => {
                    let message;

                    if (list.next_min_amount) {
                        message = `If you spend greater than and equal to<b> ${Currency} ${formatToTwoDecimalPoints(list.min_amt)}</b> <br>and less than <b>${Currency} ${formatToTwoDecimalPoints(list.next_min_amount)}</b>,
                                   you will receive <b>${formatToTwoDecimalPoints(list.point_received)} points</b>.`;
                    } else {
                        message = `If you spend greater than and equal to<b> ${Currency} ${formatToTwoDecimalPoints(list.min_amt)}</b>,<br>
                                   you will receive <b>${list.point_received} points</b>.`;
                    }

                    let qr;

                    if (list.latest_qr == null) {
                        qr = null;
                    } else {
                        qr = {
                            qr_image: list.latest_qr,
                            qr_file: `LoyaltyQR_${list.qr_date}_${list.store_name}_${list.cashier_name}_${list.qr_id}`,
                        };
                    }

                    return [
                        list.id,
                        index + 1,
                        list.min_amt,
                        list.point_received,
                        message,
                        qr,
                    ];
                });

                return data;
            },
        },
    }).render(document.getElementById("CommonTable"));
}


$("#AddDataModelToggle").click(function () {
    OpenModel({
        // These are the defaults.
        Data: '/admin/rules/create',
        Method: "GET",
        IsUrl: 1,
        Title: "Add Rules",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                NoSigns();
                $("#CommonForm").validate({
                    rules: {
                        point: {
                            required: true,
                            number: true
                        },
                        min_amt: {
                            required: true,
                            number: true
                        },
                    }
                });

                if (document.getElementById("CommonTable")) {
                    document.getElementById('CommonForm').addEventListener('submit', (Event) => {
                        Event.preventDefault();
                        if (!$("#CommonForm").valid())
                            return false;
                        const Form = Event.target;
                        const Data = new FormData(Form);
                        const FormAction = Form.getAttribute("action");
                        const Method = Form.getAttribute("method") ?? "GET";
                        // const Object = {};
                        // Data.forEach((value, key) => Object[key] = value);

                        axios({
                            method: Method,
                            url: FormAction,
                            data: Data,
                            // headers: Headers,
                        })
                            .then(response => {
                                CommonTableConfig.forceRender();
                                $("#CommonModel").modal("hide");
                                const Toast = Swal.mixin({
                                    toast: true,
                                    position: "top-end",
                                    showConfirmButton: false,
                                    timer: 3000,
                                    timerProgressBar: true,
                                    didOpen: (toast) => {
                                        toast.onmouseenter = Swal.stopTimer;
                                        toast.onmouseleave = Swal.resumeTimer;
                                    }
                                });
                                Toast.fire({
                                    icon: "success",
                                    title: "Added successfully"
                                });
                            })
                            .catch(error => {
                                console.log(error.response.data);
                                const errors = error.response.data.data;
                                Object.keys(errors).forEach(field => {
                                    const errorMessage = errors[field][0];
                                    const errorLabel = document.getElementById(`${field}-error`);
                                    errorLabel.style.display = 'block';
                                    errorLabel.innerHTML = errorMessage;
                                });
                            });
                    });
                }
            },
            Failure: (response) => { },
        },
    });
});

$("body").on("click", ".EditRecord", function () {
    var RecordId = $(this).closest(".Rowctions").attr("data-RowId");
    // alert(RecordId);

    OpenModel({
        // These are the defaults.
        Data: `/admin/rules/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Edit Rule",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                NoSigns();
                $("#CommonForm").validate({
                    rules: {
                        point: {
                            required: true,
                            number: true
                        },
                        min_amt: {
                            required: true,
                            number: true
                        },
                    }
                });
                if (document.getElementById("CommonTable")) {
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
                                CommonTableConfig.forceRender();
                                $("#CommonModel").modal("hide");
                                const Toast = Swal.mixin({
                                    toast: true,
                                    position: "top-end",
                                    showConfirmButton: false,
                                    timer: 3000,
                                    timerProgressBar: true,
                                    didOpen: (toast) => {
                                        toast.onmouseenter = Swal.stopTimer;
                                        toast.onmouseleave = Swal.resumeTimer;
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
                };

            },
            Failure: (response) => { },
        },
    });
});

$("body").on("click", ".ViewRecord", function () {
    var RecordId = $(this).closest(".Rowctions").attr("data-RowId");
    // alert(RecordId);

    OpenModel({
        // These are the defaults.
        Data: `/admin/rules/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "View Rule",
        FormData: {
            readonly: true,
        },
        Functions: {
            Init: (response) => { },
            Success: (response) => {
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
                Url: `/admin/rules/delete/${RecordId}`,
                DataType: "JSON",
                Method: "POST",
                Functions: {
                    Success: (response) => {
                        var RespData = response.data.data;
                        CommonTableConfig.forceRender();

                        Swal.fire({
                            title: 'Deleted!',
                            text: 'Your file has been deleted.',
                            icon: 'success',
                            confirmButtonClass: 'btn btn-primary w-xs mt-2',
                            buttonsStyling: false
                        })
                    },
                },
            })

        }
    });
});




document.getElementById('Zipfile').addEventListener('click', function () {
    axios({
        method: 'get',
        url: '/admin/rules/download-zip',
        responseType: 'blob',
    })
        .then(response => {
            const contentDisposition = response.headers['content-disposition'];
            
            let fileName = 'images.zip';
            if (contentDisposition) {
                const fileNameMatch = contentDisposition.match(/filename="?([^"]+)"?/);
                if (fileNameMatch.length === 2) {
                    fileName = fileNameMatch[1];
                }
            }

            const blob = response.data;
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            a.remove();
            window.URL.revokeObjectURL(url);
        })
        .catch(error => {
            console.log('Error downloading the zip file:', error.message);
            Swal.fire({
                icon: 'warning',
                // title: 'Oops...',
                text: 'You should generate QR code first !',
            });
        });
});

$("body").on("click", ".QrSection", function () {
    var RecordId = $(this).closest(".Rowctions").attr("data-RowId");
    // alert(RecordId);

    OpenModel({
        // These are the defaults.
        Data: `/admin/rules/qr-page/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "View QR",
        Functions: {
            Init: (response) => { },
            Success: (response) => {
            },
            Failure: (response) => { },
        },
    });
});

// document.getElementById('GenrateQr').addEventListener('click', function () {
//     axios({
//         method: 'post',
//         url: '/admin/rules/generate-qr',
//     })
//         .then(response => {
//             Swal.fire({
//                 html: '<div class="mt-3">' +
//                     '<lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon>' +
//                     '<h4>QR Generated Successfully</h4>' +
//                     '</div>' +
//                     '</div>',
//                 showCancelButton: true,
//                 showConfirmButton: false,
//                 cancelButtonClass: 'btn btn-primary w-xs mb-1',
//                 cancelButtonText: 'Dismiss',
//                 buttonsStyling: false,

//             });
//         })
// });

document.getElementById('GenrateQr').addEventListener('click', function () {
    Swal.fire({
        title: 'Generating QR code',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
            axios({
                method: 'post',
                url: '/admin/rules/generate-qr',
            })
                .then(response => {
                    // Replace the loading dialog with success message
                    Swal.fire({
                        html: '<div class="mt-3">' +
                            '<lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon>' +
                            '<h4>QR Generated Successfully</h4>' +
                            '</div>',
                        showCancelButton: true,
                        showConfirmButton: false,
                        cancelButtonClass: 'btn btn-primary w-xs mb-1',
                        cancelButtonText: 'Dismiss',
                        buttonsStyling: false,
                    });
                })
                .catch(error => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'QR code generation failed!',
                    });
                })
                .finally(() => {
                    Swal.hideLoading(); // Hide loading animation
                });
        }
    });
});






