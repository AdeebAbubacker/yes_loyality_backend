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
                id: "Branch Name",
                name: "Branch Name",
                width: "200px",
            },
            {
                id: "Offer code",
                name: "Offer code",
                width: "200px",
            },
            {
                id: "Comments",
                name: "Comments",
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
                        `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false'> <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li><li> <a href='#!' class='dropdown-item DuplicateRecord'> <i class='ri-file-copy-line align-bottom me-2 text-muted'></i> Duplicate </a> </li> <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> </ul></div>`
                    );
                },
            },
        ],
        server: {
            url: '/admin/storeOffers/fetch',
            then: (response) => {
                var data = response.data;
                data = data.map((list, index) => [
                    list.id,
                    index + 1,
                    list.name,
                    list.branch_name,
                    list.offer_code,
                    list.comments,
                    list.active
                ]);

                return data;
            },
        },
    }).render(document.getElementById("CommonTable"));
}

$("#AddDataModelToggle").click(function () {
    OpenModel({
        // These are the defaults.
        Data: '/admin/storeOffers/create',
        // Data: $(this).attr("href"),
        Method: "GET",
        IsUrl: 1,
        Title: "Add Offer",
        Size: 'lg',
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                pluginData();
                title_to_slug();
                NoSigns();
                // test();
                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,

                        },
                        branch_id: {
                            required: true,
                        },
                        comment: {
                            required: true,
                            maxlength: 100
                        },
                        slug: {
                            required: true,

                        },
                        type: {
                            required: true,

                        },
                        min_amount: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        max_amount: {
                            number: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        points: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        discount: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },

                        usage_limit: {
                            number: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        expiry_start: {
                            required: true,
                            dateGreaterThanToday: true,
                            dateLesserThan: '#expiry_ends'
                        },
                        expiry_ends: {
                            required: false,
                            dateGreaterThan: '#expiry_start'
                        },
                    },
                    messages: {
                        'branch_id[]': {
                            required: "Please select at least one branch"
                        },
                        comment:{
                            maxlength: "Please do not exceed 100 characters"
                        },
                        usage_limit: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        discount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        points: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        max_amount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        min_amount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        expiry_start: {
                            dateLesserThan: "Must be lesser than Valid To.",
                        },
                        expiry_ends: {
                            dateGreaterThan: "Must be greater than Valid From.",
                        }
                    },
                });
                $("#branch_id").rules("add", "required");

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
        Data: `/admin/storeOffers/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Edit Offer",
        Size: 'lg',
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                pluginData();
                NoSigns();

                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,

                        },
                        comment: {
                            required: true,
                            maxlength: 100
                        },
                        slug: {
                            required: true,

                        },
                        min_amount: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        max_amount: {
                            number: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        points: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        discount: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        usage_limit: {
                            number: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        expiry_start: {
                            required: true,
                            dateLesserThan: '#expiry_ends',
                        },
                        expiry_ends: {
                            dateGreaterThan: '#expiry_start'
                        },
                    },
                    messages: {
                        comment:{
                            maxlength: "Please do not exceed 100 characters"
                        },
                        usage_limit: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        discount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        points: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        max_amount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        min_amount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        expiry_start: {
                            dateLesserThan: "Must be lesser than Valid To.",
                        },
                        expiry_ends: {
                            dateGreaterThan: "Must be greater than Valid From.",
                        }
                    },
                });
                $("#branch_id").rules("add", "required");
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

$("body").on("click", ".DuplicateRecord", function () {
    var RecordId = $(this).closest(".Rowctions").attr("data-RowId");
    // alert(RecordId);

    OpenModel({
        // These are the defaults.
        Data: `/admin/storeOffers/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Duplicate Offer",
        Size: 'lg',
        FormData: {
            duplicate: true,
        },
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                pluginData();
                NoSigns();

                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,

                        },
                        comment: {
                            required: true,
                            maxlength: 100
                        },
                        slug: {
                            required: true,

                        },
                        min_amount: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        max_amount: {
                            number: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        points: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        discount: {
                            number: true,
                            required: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        usage_limit: {
                            number: true,
                            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
                        },
                        expiry_start: {
                            required: true,
                            dateLesserThan: '#expiry_ends',
                        },
                        expiry_ends: {
                            dateGreaterThan: '#expiry_start'
                        },
                    },
                    messages: {
                        comment:{
                            maxlength: "Please do not exceed 100 characters"
                        },
                        usage_limit: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        discount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        points: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        max_amount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        min_amount: {
                            pattern: "Please enter a value greater than or equal to 0.",
                        },
                        expiry_start: {
                            dateLesserThan: "Must be lesser than Valid To.",
                        },
                        expiry_ends: {
                            dateGreaterThan: "Must be greater than Valid From.",
                        }
                    },
                });
                $("#branch_id").rules("add", "required");
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
        Data: `/admin/storeOffers/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Size: 'lg',
        Title: "View Offer",
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
                Url: `/admin/storeOffers/delete/${RecordId}`,
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

function title_to_slug() {
    const TitleInput = document.getElementById("title");
    const SlugInput = document.getElementById("slug");

    TitleInput.addEventListener("input", function () {
        const value = TitleInput.value;
        SlugInput.value = generateSlug(value);
    });
}

function test() {
    document.getElementById('addRule').addEventListener('click', function () {
        var ruleInputs = document.getElementById('ruleInputs');
        var inputGroup = document.createElement('div');
        inputGroup.className = 'input-group mb-2';

        var input = document.createElement('input');
        input.type = 'text';
        input.className = 'form-control';
        input.name = 'rules[]';
        input.placeholder = 'Enter Rule';

        var deleteButton = document.createElement('button');
        deleteButton.type = 'button';
        deleteButton.className = 'btn btn-danger deleteRule';
        deleteButton.innerHTML = '<i class="fas fa-trash"></i>';

        deleteButton.addEventListener('click', function () {
            inputGroup.remove();
            // If all input fields are removed, add a new one
            if (ruleInputs.children.length === 0) {
                addInputField();
            }
        });

        inputGroup.appendChild(input);
        inputGroup.appendChild(deleteButton);
        ruleInputs.appendChild(inputGroup);
    });

    // JavaScript function to add a new input field
    function addInputField() {
        var ruleInputs = document.getElementById('ruleInputs');
        var inputGroup = document.createElement('div');
        inputGroup.className = 'input-group mb-2';

        var input = document.createElement('input');
        input.type = 'text';
        input.className = 'form-control';
        input.name = 'rules[]';
        input.placeholder = 'Enter Rule';

        var deleteButton = document.createElement('button');
        deleteButton.type = 'button';
        deleteButton.className = 'btn btn-danger deleteRule';
        deleteButton.innerHTML = '<i class="fas fa-trash"></i>';

        deleteButton.addEventListener('click', function () {
            inputGroup.remove();
            // If all input fields are removed, add a new one
            if (ruleInputs.children.length === 0) {
                addInputField();
            }
        });

        inputGroup.appendChild(input);
        inputGroup.appendChild(deleteButton);
        ruleInputs.appendChild(inputGroup);
    }

    // Initially add the delete button event listener for the first input field
    document.querySelector('.deleteRule').addEventListener('click', function () {
        this.parentElement.remove();
        // If all input fields are removed, add a new one
        if (document.getElementById('ruleInputs').children.length === 0) {
            addInputField();
        }
    });
}

document.getElementById('ExportData').addEventListener('click',function(){
    axios({
        method: 'get',
        url: '/admin/storeOffers/export',
        responseType: 'blob',
    })
        .then(response => {
            const url = window.URL.createObjectURL(new Blob([response.data]));
            const link = document.createElement('a');
                link.href = url;
                link.setAttribute('download', 'storeoffers.xlsx'); //or any other extension
                document.body.appendChild(link);
                link.click();
        })
})