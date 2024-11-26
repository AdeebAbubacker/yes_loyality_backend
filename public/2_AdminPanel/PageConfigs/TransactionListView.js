var CommonTableConfig = null;
var Currency = localStorage.getItem('currency');

if (document.getElementById("CommonTable")) {
    CommonTableConfig = new gridjs.Grid({
        pagination: {
            limit: 20,
        },
        sort: true,
        search: true,
        fixedHeader: true,
        columns: [
            {
                name: "ID",
                // hidden: true,
                width: "50px",
            },
            {
                id: "Date&Time",
                name: "Date & Time",
                width: "200px",
                formatter: (cell, row) => {
                    return gridjs.html(
                        `${convert_date(cell)}`
                    );
                },
            },
            // {
            //     id: "No",
            //     name: "No",
            //     width: "50px",
            //     formatter: (cell, row) => {
            //         return gridjs.html(
            //             '<span class="fw-semibold">' + cell + "</span>"
            //         );
            //     },
            // },
            {
                id: "CustomerName",
                name: "Customer Name",
                width: "150px",
            },
            {
                id: "CustomerId",
                name: "Customer Id",
                width: "150px",
            },
            {
                id: "StoreName",
                name: "Store Name",
                width: "150px",
            },
            {
                id: "CashierName",
                name: "Cashier Name",
                width: "150px",
            },
            // {
            //     id: "InvoiceNumber",
            //     name: "Invoice No",
            //     width: "150px",
            // },
            // {
            //     id: "InvoiceCost",
            //     name: "Invoice Cost",
            //     width: "150px",
            //     formatter: (cell, row) => {
            //         return gridjs.html(
            //             `${Currency} ${formatToTwoDecimalPoints(cell)}`
            //         );
            //     },
            // },
            {
                id: "PointsType",
                name: "Points Type",
                width: "150px",
                sort: false,
                formatter: (cell) => {
                    if (cell == 'debit')
                        return gridjs.html(
                            `<span class="badge badge-soft-danger text-uppercase">Debited</span>`
                        );
                    else if (cell == 'credit')
                        return gridjs.html(
                            `<span class="badge badge-soft-success text-uppercase">Credited</span>`
                        );
                },
            },
            {
                id: "Points",
                name: "Points",
                width: "150px",
            },
            // {
            //     id: "Final Cost",
            //     name: "Final Cost",
            //     width: "150px",
            //     formatter: (cell, row) => {
            //         return gridjs.html(
            //             `${Currency} ${formatToTwoDecimalPoints(cell)}`
            //         );
            //     },
            // },
            {
                id: "Action",
                name: "Action",
                width: "150px",
                sort: false,
                formatter: (cell, row) => {
                    var auth_role = document.getElementById('Auth-user-id').value;
                    // console.log(auth_role)
                    // if (auth_role == 1) {
                    //     return gridjs.html(

                    //         `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false'> <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li> <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> </ul></div>`
                    //     );
                    // } else {
                    //     return gridjs.html(
                    //         `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'>
                    //         <a href='#!' class='dropdown-item link-secondary ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> </a>
                    //         </div>`
                    //     );
                    // }
                    return gridjs.html(
                        `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'>
                        <a href='#!' class='dropdown-item link-secondary ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> </a>
                        </div>`
                    );
                },
            },
        ],
        server: {
            url: '/admin/transaction/fetch',
            then: (response) => {
                var data = response.data;
                data = data.map((list, index) => [
                    list.id,
                    list.created_at,
                    // index + 1,
                    list.username,
                    list.user_customer_id,
                    list.storename,
                    list.cashiername,
                    // list.invoice_no,
                    // list.invoice_amt,
                    list.coin_type,
                    list.coins,
                    // list.final_amt,

                ]);

                return data;
            },
        },
    }).render(document.getElementById("CommonTable"));
}

$("#AddDataModelToggle").click(function () {
    OpenModel({
        // These are the defaults.
        Data: '/admin/transaction/create',
        // Data: $(this).attr("href"),
        Method: "GET",
        IsUrl: 1,
        Title: "Add Transaction",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                CashierDetails();
                userDetails();
                $("#CommonForm").validate({
                    rules: {
                        invoice_no: {
                            required: true,
                            number: true,
                        },
                        invoice_cost: {
                            required: true,
                            number: true,
                        },
                        coins_unilized: {
                            required: true,
                            number: true,
                        },
                        final_cost: {
                            required: true,
                            number: true,
                        }

                    },
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
        Data: `/admin/transaction/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Edit Transaction",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                CashierDetails();
                $("#CommonForm").validate({
                    rules: {
                        invoice_no: {
                            required: true,
                            number: true,
                        },
                        invoice_cost: {
                            required: true,
                            number: true,
                        },
                        coins_unilized: {
                            required: true,
                            number: true,
                        },
                        final_cost: {
                            required: true,
                            number: true,
                        }

                    },
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
        Data: `/admin/transaction/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "View Transaction",
        FormData: {
            readonly: true,
        },
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
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
                Url: `/admin/transaction/delete/${RecordId}`,
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


function CashierDetails() {

    document.getElementById('store_name').addEventListener('change', function () {
        var StoreId = this.value;
        axios({
            method: 'get',
            url: '/admin/transaction/fetch_cashiers',
            params: {
                branch_id: StoreId
            }
        })
            .then(response => {

                const cashiers = response.data.data;
                renderUserSelect(cashiers);
            })

    });
}
function renderUserSelect(users) {
    // Find the parent element where the select will be appended
    const selectContainer = document.getElementById('user_select_container');

    // Clear previous content
    selectContainer.innerHTML = '';

    // Create label element
    const label = document.createElement('label');
    label.setAttribute('for', 'cashier_name');
    label.textContent = 'Cashier Name';
    selectContainer.appendChild(label);

    // Create select element
    const userSelect = document.createElement('select');
    userSelect.classList.add('form-select');
    userSelect.setAttribute('id', 'cashier_name');
    userSelect.setAttribute('name', 'cashier_name');
    userSelect.setAttribute('data-choices', '');

    // Create and append default option
    const defaultOption = document.createElement('option');
    defaultOption.value = '';
    defaultOption.textContent = 'Select Cashier';
    userSelect.appendChild(defaultOption);

    // Append options for each user
    users.forEach(user => {
        const option = document.createElement('option');
        option.value = user.id;
        option.textContent = user.customer_id + ' -' + user.phone;
        userSelect.appendChild(option);
    });

    // Append the select element to the container
    selectContainer.appendChild(userSelect);
    initChoices();
}


function userDetails() {
    document.getElementById('user_name').addEventListener('change', function () {
        var UserId = this.value;

        axios({
            method: 'get',
            url: '/admin/customer/info',
            params: {
                customer_id: UserId
            }
        })
            .then(response => {

                const user_details = response.data.data;
                console.log(user_details[0].name);
                const selectedelement = document.getElementById('user_info');
                if (!UserId) {
                    selectedelement.innerHTML = ``;
                } else {
                    selectedelement.innerHTML = `<div class="card">
                    <div class="card-header">
                        <h6 class="card-title mb-0">User Details</h6>
                    </div>
                    <div class="card-body p-4 text-center">
                        <div class="mx-auto avatar-md mb-3">
                            <img src="/storage/file_uploads/user/${user_details[0].id}/${user_details[0].image}" alt=""
                                class="img-fluid rounded-circle">
                        </div>
                        <h5 class="card-title mb-1">${user_details[0].name}</h5>
                        <p class="text-muted mb-0">Total Points - <span class="badge bg-warning">${user_details[0].wallet_total}</span></p>
                        <p class="text-muted mb-0">Used Points - <span class="badge bg-danger">${user_details[0].wallet_used}</span></p>
                        <p class="text-muted mb-0">Balance Points - <span class="badge bg-success">${user_details[0].wallet_balance}</span></p>
    
                    </div>
                </div>`;
                }

            });


        console.log("Selected value: " + UserId);
    });
}

document.getElementById('ExportData').addEventListener('click', function () {
    axios({
        method: 'get',
        url: '/admin/transaction/export',
        responseType: 'blob',
    })
        .then(response => {
            const url = window.URL.createObjectURL(new Blob([response.data]));
            const link = document.createElement('a');
            link.href = url;
            link.setAttribute('download', 'transaction.xlsx'); //or any other extension
            document.body.appendChild(link);
            link.click();
        })
})
function convert_date(isoDate) {
    const dateObj = new Date(isoDate);

    // Options for formatting the date with Indian Standard Time (IST)
    const options = {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric',
        // timeZoneName: 'short',
        timeZone: 'Australia/Melbourne' // Specify Indian Standard Time
    };

    const formatter = new Intl.DateTimeFormat('en-US', options);
    const readableDate = formatter.format(dateObj);

    return readableDate;
}

document.addEventListener('DOMContentLoaded', function () {
    var searchFields = document.querySelectorAll('input[data-type="search"]');

    searchFields.forEach(function (field) {
        field.addEventListener('input', function (event) {
            handleSearch(event.target);
        });
    });

    function handleSearch(target) {
        var key = target.name;
        var value = target.value;

        if (target.type === "search") {
            return;
        }

        CommonTableConfig.updateConfig({
            server: {
                url: `/admin/transaction/fetch?${key}=${value}`,
                then: (response) => {
                    var data = response.data;
                    data = data.map((list, index) => [
                        list.id,
                        list.created_at,
                        list.username,
                        list.user_customer_id,
                        list.storename,
                        list.cashiername,
                        list.coin_type,
                        list.coins,
                    ]);

                    return data;
                },
            },
        }).forceRender();
        // clearAllInputs(target);
    }

    function clearAllInputs(exceptInput) {
        var searchFields = document.querySelectorAll('input[data-type="search"]');

        searchFields.forEach(function (field) {
            if (field !== exceptInput) {
                field.value = ''; // Clear input field value
            }
        });
    }
});