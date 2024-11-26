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
                id: "Description",
                name: "Description",
                width: "200px",
            },
            {
                id: "Content",
                name: "Content",
                width: "200px",
                formatter: (cell) => {
                    return gridjs.html(
                        `${cell}`
                    )

                },
            },
            {
                id: "Icon",
                name: "Icon",
                width: "100px",
                formatter: (cell) => {

                    return gridjs.html(
                        `<span class="badge badge-soft-primary text-uppercaseclg"><i class="${cell} text-primary" style="font-size: 30px;"></i></span>`
                    )

                },
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
                        `<div class='dropdown d-inline-block Rowctions' data-RowId='${row.cells[0].data}'> <button class='btn btn-soft-secondary btn-sm dropdown' type='button' data-bs-toggle='dropdown' aria-expanded='false'> <i class='ri-more-fill align-middle'></i> </button> <ul class='dropdown-menu dropdown-menu-end'> <li> <a href='#!' class='dropdown-item ViewRecord'> <i class='ri-eye-fill align-bottom me-2 text-muted'></i> View </a> </li> <li> <a href='#!' class='dropdown-item EditRecord'> <i class='ri-pencil-fill align-bottom me-2 text-muted'></i> Edit </a> </li> <li> <a href='#!' class='dropdown-item text-danger DeleteRecord' > <i class='ri-delete-bin-fill align-bottom me-2 text-danger'></i> Delete </a> </li> </ul></div>`
                    );
                },
            },
        ],
        server: {
            url: '/admin/pages/page_list',
            then: (response) => {
                var data = response.data;
                data = data.map((list, index) => [
                    list.id,
                    index + 1,
                    list.page_name,
                    list.page_description,
                    // list.short_description,
                    list.page_contents,
                    list.icon,
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
        Data: '/admin/pages/create',
        // Data: $(this).attr("href"),
        Method: "GET",
        IsUrl: 1,
        Title: "Add New Page",
        Size: 'lg',
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                title_to_all();
                description_to_all();
                tag_to_all();
                title_to_slug();
                QuillEditor('page-editor','content');


                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,

                        },
                        slug: {
                            required: true,

                        },
                        content: {
                            required: true,

                        },
                        description: {
                            required: true,

                        },
                        meta_title: {
                            required: true,

                        },
                        meta_description: {
                            required: true,

                        },
                        icon: {
                            required: true,

                        },
                        og_type: {
                            required: true,

                        },
                        og_title: {
                            required: true,

                        },
                        og_description: {
                            required: true,

                        },

                        og_tag: {
                            required: true,

                        },

                        og_sitename: {
                            required: true,

                        },

                        og_url: {
                            required: true,

                        },

                        twitter_title: {
                            required: true,

                        },

                        twitter_description: {
                            required: true,

                        },

                        twitter_tag: {
                            required: true,

                        },

                        twitter_sitename: {
                            required: true,

                        },
                        twitter_card: {
                            required: true,

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
        Data: `/admin/pages/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Edit Page",
        Size: 'lg',
        FormData: {},
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                title_to_slug();
                QuillEditor('page-editor','content');

                $("#CommonForm").validate({
                    rules: {
                        name: {
                            required: true,

                        },
                        slug: {
                            required: true,

                        },
                        content: {
                            required: true,

                        },
                        description: {
                            required: true,

                        },
                        meta_title: {
                            required: true,

                        },
                        meta_description: {
                            required: true,

                        },
                        icon: {
                            required: true,

                        },
                        og_type: {
                            required: true,

                        },
                        og_title: {
                            required: true,

                        },
                        og_description: {
                            required: true,

                        },

                        og_tag: {
                            required: true,

                        },

                        og_sitename: {
                            required: true,

                        },

                        og_url: {
                            required: true,

                        },

                        twitter_title: {
                            required: true,

                        },

                        twitter_description: {
                            required: true,

                        },

                        twitter_tag: {
                            required: true,

                        },

                        twitter_sitename: {
                            required: true,

                        },
                        twitter_card: {
                            required: true,

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
        Data: `/admin/pages/edit/${RecordId}`,
        Method: "POST",
        IsUrl: 1,
        Title: "Pages",
        Size: 'lg',
        FormData: {
            readonly: true,
        },
        Functions: {
            Init: (response) => { },
            Success: (response) => {
                initChoices();
                title_to_slug();
                QuillEditor('page-editor','content');
                $("#CommonForm").validate({
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
                Url: `/admin/pages/delete/${RecordId}`,
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

function title_to_all() {
    const metaTitleInput = document.getElementById("meta_title");
    const twitterTitleInput = document.getElementById("og_title");
    const ogTitleInput = document.getElementById("twitter_title");

    metaTitleInput.addEventListener("input", function () {
        const value = metaTitleInput.value;
        ogTitleInput.value = value;
        twitterTitleInput.value = value;
    });
}

function tag_to_all() {
    const metaTagInput = document.getElementById("meta_tag");
    const twitterTagInput = document.getElementById("og_tag");
    const ogTagInput = document.getElementById("twitter_tag");

    metaTagInput.addEventListener("input", function () {
        const value = metaTagInput.value;
        ogTagInput.value = value;

        console.log(ogTagInput)
        twitterTagInput.value = value;
    });
}

function description_to_all() {
    const metaDescriptionInput = document.getElementById("meta_description");
    const twitterDescriptionInput = document.getElementById("og_description");
    const ogDescriptionInput = document.getElementById("twitter_description");

    metaDescriptionInput.addEventListener("input", function () {
        const value = metaDescriptionInput.value;
        ogDescriptionInput.value = value;
        twitterDescriptionInput.value = value;
    });
}

function title_to_slug() {
    const pageTitleInput = document.getElementById("page_title");
    const pageSlugInput = document.getElementById("page_slug");

    pageTitleInput.addEventListener("input", function () {
        const value = pageTitleInput.value;
        pageSlugInput.value = generateSlug(value);
    });
}



