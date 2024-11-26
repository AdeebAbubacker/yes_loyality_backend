var CommonTableConfig = null;
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
                id: "Name",
                name: "Name",
                width: "200px",
            },
            {
                id: "Address",
                name: "Address",
                width: "200px",
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
                id: "Location",
                name: "Location",
                width: "200px",
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
                        `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false'> <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li>  </ul></div>`
                    );
                },
            },
        ],
        server: {
            url: '/admin/store/fetch',
            then: (response) => {
                var data = response.data;
                data = data.map((list, index) => [
                    list.id,
                    index + 1,
                    list.name,
                    list.address,
                    list.phone_1,
                    list.location,
                    list.active
                ]);

                return data;
            },
        },
    }).render(document.getElementById("CommonTable"));
}

{/* <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> */}

$("#AddDataModelToggle").click(function () {
    OpenModel({
        // These are the defaults.
        Data: '/admin/store/create',
        // Data: $(this).attr("href"),
        Method: "GET",
        IsUrl: 1,
        Title: "Add Store",
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                
                initChoices();
                country_code('phone_1', 'full_phone1');
                country_code('phone_2', 'full_phone2');
                

                // phone();
                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,
                            maxlength: 75,
                            pattern: /^[a-zA-Z0-9\s]+$/,
                        },
                        location: {
                            required: true,

                        },
                        address: {
                            required: true,
                            maxlength: 200
                        },
                        coordinates: {
                            required: true,
                        },
                        key_name: {
                            required: true,
                            pattern: /^[A-Za-z][A-Za-z' -]+([ A-Za-z][A-Za-z' -]*)*$/
                        },
                        support_name: {
                            pattern: /^[A-Za-z][A-Za-z' -]+([ A-Za-z][A-Za-z' -]*)*$/
                        },
                        full_phone1:{
                            required: true,
                            // phoneInternational: true
                            minlength: 9
                        },
                        full_phone2:{
                            // phoneInternational: true
                            minlength: 9
                        },
                        // phone_1: {
                        //     required: true,
                        // },
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
                        name:{
                            pattern: "Please enter a valid name"
                        },
                        full_phone1:{
                            minlength: "Please enter a valid Phone Number"
                        },
                        full_phone2:{
                            minlength: "Please enter a valid Phone Number"
                        },
                        email_1: {
                            pattern: "Please enter a valid email address"
                        },
                        email_2: {
                            pattern: "Please enter a valid email address"
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
                            maxlength: 75,
                            pattern: /^[a-zA-Z0-9\s]+$/,
                        },
                        location: {
                            required: true,
                        },
                        address: {
                            required: true,
                            maxlength: 200

                        },
                        coordinates: {
                            required: true,
                        },
                        key_name: {
                            required: true,
                            pattern: /^[A-Za-z][A-Za-z' -]+([ A-Za-z][A-Za-z' -]*)*$/
                        },
                        support_name: {
                            pattern: /^[A-Za-z][A-Za-z' -]+([ A-Za-z][A-Za-z' -]*)*$/
                        },
                        full_phone1:{
                            required: true,
                            // phoneInternational: true
                            minlength: 9
                        },
                        full_phone2:{
                            // phoneInternational: true
                            minlength: 9
                        },
                        // phone_1: {
                        //     required: true,
                        // },
                        // phone_2: {
                        // },
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
                        name:{
                            pattern: "Please enter a valid name"
                        },
                        full_phone1:{
                            minlength: "Please enter a valid Phone Number"
                        },
                        full_phone2:{
                            minlength: "Please enter a valid Phone Number"
                        },
                        email_1: {
                            pattern: "Please enter a valid email address"
                        },
                        email_2: {
                            pattern: "Please enter a valid email address"
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
        Data: `/admin/store/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "View Store",
        FormData: {
            readonly: true,
        },
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                country_code('phone_1', 'full_phone1');
                country_code('phone_2', 'full_phone2');
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
                Url: `/admin/store/delete/${RecordId}`,
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

document.getElementById('ExportData').addEventListener('click',function(){
    axios({
        method: 'get',
        url: '/admin/store/export',
        responseType: 'blob',
    })
        .then(response => {
            const url = window.URL.createObjectURL(new Blob([response.data]));
            const link = document.createElement('a');
                link.href = url;
                link.setAttribute('download', 'stores.xlsx'); //or any other extension
                document.body.appendChild(link);
                link.click();
        })
})

