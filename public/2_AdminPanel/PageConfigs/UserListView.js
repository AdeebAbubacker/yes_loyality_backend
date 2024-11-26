// const gridOptions = {

//     // Column Definitions: Defines the columns to be displayed.
//     columnDefs: [
//         { field: "id", hide: true },
//         // { field: "No" },
//         { field: "name" },
//         { field: "email" },
//         { field: "phone" },
//         {
//             field: "role_id",
//             cellRenderer: (params) => {
//                 if (params.value === 1) {
//                     return `<span  class="badge badge-soft-primary text-uppercase">Super Admin</span>`;
//                 } else if (params.value === 2) {
//                     return `<span class="badge badge-soft-secondary text-uppercase">Admin</span>`;
//                 } else if (params.value === 3) {
//                     return `<span class="badge badge-soft-info text-uppercase">Branch Manager</span>`;
//                 } else if (params.value === 4) {
//                     return `<span class="badge badge-soft-success text-uppercase">Cashier</span>`;
//                 } else if (params.value === 5) {
//                     return `<span class="badge badge-soft-warning text-uppercase">User</span>`;
//                 }
//             },
//         },
//         {
//             field: "active",
//             cellRenderer: (params) => {
//                 if (params.value === 1) {
//                     return `<span  class="badge badge-soft-success text-uppercase">Active</span>`;
//                 } else {
//                     return `<span class="badge badge-soft-danger text-uppercase">InActive</span>`;
//                 }
//             },
//         },
//         {
//             field: "Action",
//             filter: false,
//             cellRenderer: (params) => {
//                 return `<div class='dropdown d-inline-block Rowctions' data-RowId=''> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false' > <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li> <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> <li> <a href='#!' class='dropdown-item text-primary EditPassword' > <i class='ri-lock-fill align-bottom me-2 text-primary'></i>Change Password</a> </li></ul></div>`
//             },
//         },
//     ],
//     // Row Data: The data to be displayed.
//     rowData: null,
//     pagination: true,
//     paginationPageSize: 10,
//     paginationPageSizeSelector: [10, 20, 100],

//     defaultColDef: {
//         filter: "agTextColumnFilter",
//         floatingFilter: true,
//     },
// };

// // Your Javascript code to create the Data Grid
// document.addEventListener("DOMContentLoaded", function () {
//     var gridDiv = document.querySelector("#myGrid");
//     gridApi = agGrid.createGrid(gridDiv, gridOptions);

//     fetch("/admin/users/fetch/")
//         .then((response) => response.json())
//         .then((data) => gridApi.setGridOption("rowData", data.data));
// });
var CommonTableConfig = null;

var htmlElement = document.querySelector('html');
var roleId = htmlElement.getAttribute('data-user-role-id');
var hideSAdmin = null;
var hideAdmin = null;
var hideBM = null;

if (roleId == 2) {
    hideSAdmin = "hidden";
    hideAdmin = "hidden";
    // alert('---')
} else if (roleId == 3) {
    hideSAdmin = "hidden";
    hideAdmin = "hidden";
    hideBM = 'hidden';
} else {

}

if (document.getElementById("CommonTable")) {
    CommonTableConfig = new gridjs.Grid({
        pagination: {
            limit: 20
        },
        sort: true,
        search: {
          server: {
            url: (prev, keyword) => `${prev}?search=${keyword}`
          }
        },
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
                id: "CustomerId",
                name: "User Id",
                width: "200px",
            },
            {
                id: "Name",
                name: "Name",
                width: "200px",
            },
            {
                id: "Email",
                name: "Email",
                width: "200px",
                formatter: (cell) => {
                    return gridjs.html(
                        `<p><a href="mailto:${cell}" class="link-primary">${cell}</a></p>`
                    );
                },
            },
            {
                id: "Phone",
                name: "Phone",
                width: "200px",
                formatter: (cell) => {
                    return gridjs.html(
                        `<p>${formatPhoneNumber(cell)}</p>`
                    );
                },
            },
            {
                id: "Branch",
                name: "Branch",
                width: "200px",
            },
            {
                id: "Role",
                name: gridjs.html(`<div class="d-flex justify-content-between p-1">
                        <div>Role</div>
                        <div>
                            <button id="UserRoleFilter" class="gridjs-sort"><i class='bx bx-filter' style="color:#919da9"></i></button>
                        </div>
                        <div id="popup" class="popup">
                            <input class="form-check-input UserRoleFilterOpt" type="radio" id="AllUserRoleFilter" value="" checked data-id="0">
                            <label class="form-check-label" for="AllUserRoleFilter">
                                All
                            </label><br>
                            
                            <input class="form-check-input UserRoleFilterOpt" type="radio" id="SAUserRoleFilter" value="1" data-id="1" ${hideSAdmin}>
                            <label class="form-check-label" for="SAUserRoleFilter" ${hideSAdmin}>
                                Super Admin
                            </label><br ${hideSAdmin}>
                            
                            <input class="form-check-input UserRoleFilterOpt" type="radio" id="AUserRoleFilter" value="2" data-id="2" ${hideAdmin}>
                            <label class="form-check-label" for="AUserRoleFilter" ${hideAdmin}>
                                Admin
                            </label><br ${hideAdmin}>
                        
                            <input class="form-check-input UserRoleFilterOpt" type="radio" id="BMUserRoleFilter" value="3" data-id="3" ${hideBM}>
                            <label class="form-check-label" for="BMUserRoleFilter" ${hideBM}>
                                Branch Manager
                            </label><br ${hideBM}>
                            <input class="form-check-input UserRoleFilterOpt" type="radio" id="CUserRoleFilter" value="4" data-id="4">
                            <label class="form-check-label" for="CUserRoleFilter">
                                Cashier
                            </label><br>
                        
                            <input class="form-check-input UserRoleFilterOpt" type="radio" id="UUserRoleFilter" value="5" data-id="5">
                            <label class="form-check-label" for="UUserRoleFilter">
                                User
                            </label>
                            <br>
                            <!-- Buttons with Label -->
                            <button type="button" class="btn btn-danger btn-label waves-effect waves-light mt-2" id="ApplyFilter">
                                <i class="ri-filter-3-fill label-icon align-middle fs-1 me-2"></i> Apply Filter
                            </button>
                        </div>
                    </div>`),
                width: "200px",
                formatter: (cell) => {
                    if (cell == 1)
                        return gridjs.html(
                            `<span class="badge badge-soft-primary text-uppercase">Super Admin</span>`
                        );
                    else if (cell == 2)
                        return gridjs.html(
                            `<span class="badge badge-soft-secondary text-uppercase">Admin</span>`
                        );
                    else if (cell == 3)
                        return gridjs.html(
                            `<span class="badge badge-soft-info text-uppercase">Branch Manager</span>`
                        );
                    else if (cell == 4)
                        return gridjs.html(
                            `<span class="badge badge-soft-success text-uppercase">Cashier</span>`
                        );
                    else if (cell == 5)
                        return gridjs.html(
                            `<span class="badge badge-soft-warning text-uppercase">User</span>`
                        );
                },
                sort: false
            },

            {
                id: "Status",
                name: "Status",
                width: "150px",
                formatter: (cell) => {
                    if (cell == false)
                        return gridjs.html(
                            `<span class="badge badge-soft-danger text-uppercase">InActive</span>`
                        );
                    else
                        return gridjs.html(
                            `<span class="badge badge-soft-success text-uppercase">Active</span>`
                        );
                },
            },
            {
                id: "Action",
                name: "Action",
                width: "100px",
                sort: false,
                formatter: (cell, row) => {
                    // console.log(row);
                    // alert(row.cells[0].data);
                    return gridjs.html(
                        `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false' > <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li> <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> <li> <a href='#!' class='dropdown-item text-primary EditPassword' > <i class='ri-lock-fill align-bottom me-2 text-primary'></i>Change Password</a> </li></ul></div>`
                    );
                },
            },
        ],
        server: {
            url: '/admin/users/fetch/',
            then: (response) => {
                var data = response.data;
                data = data.map((list, index) => [
                    list.id,
                    index + 1,
                    list.customer_id,
                    list.name,
                    list.email,
                    list.phone,
                    list.branch_name,
                    list.role_id,
                    list.active
                ]);

                return data;
            },
        },
    }).render(document.getElementById("CommonTable"));
}
EventListeners();

$("#AddDataModelToggle").click(function () {
    OpenModel({
        // These are the defaults.
        Data: '/admin/users/create',
        // Data: $(this).attr("href"),
        Method: "GET",
        IsUrl: 1,
        Title: "Add User",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                country_code('phone', 'full_phone');
                password_to_show();

                branchSelection();

                // $("select.choices__input").closest(".choices").append(`<label id="branch-error" class="" for="branch">Jkk.</label>`);

                // $(`<label id="branch-error" class="" for="branch">Jkk.</label>`).insertAfter($("select.choices__input").parent(".choices__inner"));

                $("#CommonForm").validate({
                    // ignore: ":hidden:not([data-choices]),:hidden > .selectized, .selectize-control .selectize-input input",
                    rules: {
                        name: {
                            required: true,
                        },
                        email: {
                            required: true,
                            email: true,
                            pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,

                        },
                        // phone: {
                        //     required: true,
                        // },
                        full_phone: {
                            required: true,
                            // phoneInternational: true
                            minlength: 9
                        },
                        role: {
                            required: true,
                        },
                        branch: {
                            required: true,
                        },
                        password: {
                            required: true,
                            minlength: 8,
                            pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/,
                        },
                        c_password: {
                            required: true,
                            minlength: 8,
                            equalTo: "#password"
                        },
                    },
                    messages: {
                        full_phone: {
                            minlength: "Please enter a valid Phone Number"
                        },
                        name: {
                            required: "Please enter your name",
                        },
                        email: {
                            required: "Please enter your email",
                            email: "Please enter a valid email address",
                            pattern: "Please enter a valid email address"
                        },
                        phone: {
                            required: "Please enter your phone number",
                        },
                        role: {
                            required: "Please select a role",
                        },
                        branch: {
                            required: "Please select a branch",
                        },
                        password: {
                            required: "Please provide a password",
                            minlength: "Your password must be at least 8 characters long",
                            pattern: "Minimum eight characters, at least one letter, one number and one special character"
                        },
                        c_password: {
                            required: "Please confirm your password",
                            minlength: "Your password must be at least 8 characters long",
                            equalTo: "Please enter the same password as above"
                        },
                    },
                    // errorPlacement: function (error, element) {
                    //     if (element.attr("name") == "role") {
                    //         error.insertAfter("#role-error");
                    //     } else {
                    //         error.insertAfter(element);
                    //     }
                    // }
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
        Data: `/admin/users/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Edit User",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();

                branchSelection();
                country_code('phone', 'full_phone');
                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,
                        },
                        email: {
                            required: true,
                            email: true,
                            pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,

                        },
                        // phone: {
                        //     required: true,
                        // },
                        full_phone: {
                            required: true,
                            // phoneInternational: true
                            minlength: 9
                        },
                        role: {
                            required: true,
                        },
                        // branch: {
                        //     required: true,
                        // },
                    },
                    messages: {
                        full_phone: {
                            minlength: "Please enter a valid Phone Number"
                        },
                        name: {
                            required: "Please enter your name",
                        },
                        email: {
                            required: "Please enter your email",
                            email: "Please enter a valid email address",
                            pattern: "Please enter a valid email address"
                        },
                        phone: {
                            required: "Please enter your phone number",
                        },
                        role: {
                            required: "Please select a role",
                        },
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
                                CommonTableConfig.on('render', EventListeners());
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
                                const errors = error.response.data.data;
                                Object.keys(errors).forEach(field => {
                                    const errorMessage = errors[field][0];
                                    const errorLabel = document.getElementById(`${field}-error`);
                                    errorLabel.style.display = 'block';
                                    errorLabel.innerHTML = errorMessage;
                                });
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
        Data: `/admin/users/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "View User",
        FormData: {
            readonly: true,
        },
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                country_code('phone', 'full_phone');
            },
            Failure: (response) => { },
        },
    });
});

$("body").on("click", ".EditPassword", function () {
    var RecordId = $(this).closest(".Rowctions").attr("data-RowId");
    // alert(RecordId);

    OpenModel({
        // These are the defaults.
        Data: `/admin/users/password_form/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Change Password",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                password_to_show();
                $("#CommonForm").validate({
                    rules: {
                        password: {
                            required: true,
                            minlength: 8,
                            pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/,
                        },
                        c_password: {
                            required: true,
                            minlength: 8,
                            equalTo: "#password"
                        },
                    },
                    messages: {
                        password: {
                            required: "Please provide a password",
                            minlength: "Your password must be at least 8 characters long",
                            pattern: "Minimum eight characters, at least one letter, one number and one special character"
                        },
                        c_password: {
                            required: "Please confirm your password",
                            minlength: "Your password must be at least 8 characters long",
                            equalTo: "Please enter the same password as above"
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
                                    title: "Password Changed successfully"
                                });
                            })
                            .catch(error => {
                                const errors = error.response.data.data;
                                Object.keys(errors).forEach(field => {
                                    const errorMessage = errors[field][0];
                                    const errorLabel = document.getElementById(`${field}-error`);
                                    errorLabel.style.display = 'block';
                                    errorLabel.innerHTML = errorMessage;
                                });
                            });
                    });
                };

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
                Url: `/admin/users/delete/${RecordId}`,
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






function password_to_show() {
    Array.from(document.querySelectorAll("form .auth-pass-inputgroup")).forEach(function (item) {
        Array.from(item.querySelectorAll(".password-addon")).forEach(function (subitem) {
            subitem.addEventListener("click", function (event) {
                const inputElement = subitem.getAttribute('data-target');
                var passwordInput = document.getElementById(inputElement);
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                } else {
                    passwordInput.type = "password";
                }
            });
        });
    });
}


function branchSelection() {
    document.getElementById('role').addEventListener('change', function () {
        var role = document.getElementById('role').value;
        console.log(role)

        var branchSection = document.getElementById('branchSection');


        if (role == 3 || role == 4) {
            branchSection.removeAttribute('hidden');
        } else {
            branchSection.setAttribute('hidden', '');
            $("#branch").rules("remove", "required");
        }
    })
}

function EventListeners() {
    document.getElementById('ApplyFilter').addEventListener('click', (event) => {
        const popup = document.getElementById('popup');
        popup.style.display = 'none';

        var role_id = null;
        const checkedCheckbox = document.querySelector('#popup input[type="radio"]:checked');
        if (checkedCheckbox) {
            role_id = checkedCheckbox.value;
        } else {
            role_id = '';
        }

        console.log(role_id);
        CommonTableConfig.updateConfig({
            server: {
                url: `/admin/users/fetch/${role_id}`,
                then: (response) => {
                    var data = response.data;
                    data = data.map((list, index) => [
                        list.id,
                        index + 1,
                        list.customer_id,
                        list.name,
                        list.email,
                        list.phone,
                        list.branch_name,
                        list.role_id,
                        list.active
                    ]);

                    return data;
                },
            },
        }).forceRender();
        CommonTableConfig.on('render', EventListeners());
    });

    document.getElementById('UserRoleFilter').addEventListener('click', () => {
        const popup = document.getElementById('popup');
        popup.style.display = popup.style.display === 'block' ? 'none' : 'block';
    });

    document.addEventListener('click', (event) => {
        if (!popup.contains(event.target) && event.target.id !== 'UserRoleFilter') {
            popup.style.display = 'none';
        }
    });

    // Ensure only one checkbox is checked at a time
    document.querySelectorAll('#popup input[type="radio"]').forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            if (this.checked) {
                document.querySelectorAll('#popup input[type="radio"]').forEach(cb => {
                    if (cb !== this) cb.checked = false;
                });
            }
        });
    });
}

document.getElementById('ExportData').addEventListener('click', function () {
    axios({
        method: 'get',
        url: '/admin/users/export',
        responseType: 'blob',
    })
        .then(response => {
            const url = window.URL.createObjectURL(new Blob([response.data]));
            const link = document.createElement('a');
            link.href = url;
            link.setAttribute('download', 'users.xlsx'); //or any other extension
            document.body.appendChild(link);
            link.click();
        })
});

document.addEventListener('DOMContentLoaded', function () {
    var searchFields = document.querySelectorAll('input[data-type="search"], select[data-type="search"]');

    searchFields.forEach(function (field) {
        field.addEventListener('input', function (event) {
            handleSearch(event.target);
        });

        field.addEventListener('change', function (event) {
            handleSearch(event.target);
        });
    });

    function handleSearch(target) {
        var key = target.name;
        var value = target.value;

        if (target.type === "search" || (key === "active" && value === "")) {
            return;
        }

        CommonTableConfig.updateConfig({
            server: {
                url: `/admin/users/fetch?${key}=${value}`,
                then: (response) => {
                    var data = response.data;
                    data = data.map((list, index) => [
                        list.id,
                        index + 1,
                        list.customer_id,
                        list.name,
                        list.email,
                        list.phone,
                        list.branch_name,
                        list.role_id,
                        list.active
                    ]);

                    return data;
                },
            },
        }).forceRender();
        CommonTableConfig.on('render', EventListeners());

        clearAllInputs(target);
    }

    function clearAllInputs(exceptInput) {
        var searchFields = document.querySelectorAll('input[data-type="search"], select[data-type="search"]');

        searchFields.forEach(function (field) {
            if (field !== exceptInput) {
                if (field.tagName.toLowerCase() === 'select') {
                    field.selectedIndex = 0; // Reset select field to its default option
                } else {
                    field.value = ''; // Clear input field value
                }
            }
        });
    }
});

document.getElementById('select-filter').addEventListener('change', function () {
    if (this.value === "") {
        CommonTableConfig.updateConfig({
            server: {
                url: `/admin/users/fetch`,
                then: (response) => {
                    var data = response.data;
                    data = data.map((list, index) => [
                        list.id,
                        index + 1,
                        list.customer_id,
                        list.name,
                        list.email,
                        list.phone,
                        list.branch_name,
                        list.role_id,
                        list.active
                    ]);

                    return data;
                },
            },
        }).forceRender();
        CommonTableConfig.on('render', EventListeners());
    }
})

