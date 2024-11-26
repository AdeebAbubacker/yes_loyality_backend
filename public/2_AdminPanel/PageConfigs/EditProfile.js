
country_code('phone', 'full_phone');

document.addEventListener('DOMContentLoaded', function () {

    var selectElement = document.getElementById('branch');
    var choices = new Choices(selectElement, {
        position: 'top',
        renderChoiceLimit: 3,
        searchResultLimit: 6,
    });
});

$("#profile-edit").validate({
    rules: {
        name: {
            required: true,
        },
        // phone: {
        //     required: true,
        // },
        full_phone:{
            required: true,
            // phoneInternational: true
            minlength: 10
        },
        email: {
            required: true,
            email: true,
        }
    },
    messages: {
        full_phone:{
            minlength: "Please enter a valid Phone Number"
        },
    },
});


document.getElementById('profile-edit').addEventListener('submit', (Event) => {
    Event.preventDefault();
    if (!$("#profile-edit").valid())
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
                    // location.reload();
                    window.location.href = '/admin/profile'
                }
            });
            Toast.fire({
                icon: "success",
                title: "Updated successfully"
            });
        })
        .catch(error => {
            console.log(error.response.data);
            const errors = error.response.data.data;
            Object.keys(errors).forEach(field => {
                const errorMessage = errors[field][0];
                const errorLabel = document.getElementById(`${field}-error`);
                errorLabel.removeAttribute('hidden');
                errorLabel.style.display = 'block';
                errorLabel.innerHTML = errorMessage;
            });
        });
});

document.getElementById('profile-img-file-input').addEventListener('click', (event) => {

    Swal.fire({
        html: '<div class="mt-3 text-start">' +
            '<label for="input-image" class="form-label fs-13">Upload Image</label>' +
            '<input type="file" class="form-control" id="input-image" placeholder="">' +
            '</div><label for="input-image" class="error" id="file-error" style="font-weight: 100;font-size: 13px;"></label>',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: 'Update',
        confirmButtonClass: 'btn btn-primary w-xs me-2',
        cancelButtonClass: 'btn btn-danger w-xs',
        denyButtonClass: 'btn btn-warning w-xs me-2',
        denyButtonText: 'Remove',
        buttonsStyling: false,
        showCloseButton: true,
        preConfirm: () => {
            const inputFile = document.getElementById('input-image');
            const errorDiv = document.getElementById('file-error');
            errorDiv.textContent = '';

            if (!inputFile.files[0]) {
                errorDiv.textContent = 'Please select a file.';
                return false;
            }

            const file = inputFile.files[0];
            const validTypes = ['image/jpeg', 'image/png', 'image/jpg'];

            if (!validTypes.includes(file.type)) {
                errorDiv.textContent = 'Invalid file type. Please select an image file (jpg, jpeg, png).';
                return false;
            }

            if (file.size > 5 * 1024 * 1024) { // 5MB
                errorDiv.textContent = 'File size should not exceed 5MB.';
                return false;
            }

            return true;
        }

    }).then(function (result) {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            const inputFile = document.getElementById('input-image');
            const file = inputFile.files[0];

            const formData = new FormData();
            formData.append('file', file);
            axios({
                method: 'post',
                url: '/admin/update/image',
                data: formData,
                headers: {
                    'Content-Type': 'multipart/form-data',
                }
            })
                .then(response => {
                })
                .catch(error => {

                });
            Swal.fire({
                title: 'Updated Successfully!',
                icon: 'success',
                confirmButtonClass: 'btn btn-primary w-xs',
                buttonsStyling: false,
                didClose: () => {
                    // location.reload();
                    window.location.href = '/admin/profile'
                }
            });
        } else if (result.isDenied) {
            axios({
                method: 'post',
                url: '/admin/remove/image',
            })
                .then(response => {
                })
                .catch(error => {

                });
            Swal.fire({
                title: 'Removed Successfully!',
                icon: 'warning',
                confirmButtonClass: 'btn btn-primary w-xs',
                buttonsStyling: false,
                didClose: () => {
                    // location.reload();
                    window.location.href = '/admin/profile'
                }
            });
            
        }
    });

});

$("#change-password").validate({
    rules: {
        current_password: {
            required: true,
        },
        new_password: {
            required: true,
        },
        confirm_password: {
            required: true,
            equalTo: "#new_password"
        }
    },
});

document.getElementById('change-password').addEventListener('submit', (Event) => {
    Event.preventDefault();
    if (!$("#change-password").valid())
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
                title: "Password Changed successfully"
            });
        })
        .catch(error => {
            const errors = error.response.data.data;
            Object.keys(errors).forEach(field => {
                const errorMessage = errors[field][0];
                const errorLabel = document.getElementById(`${field}-error`);
                errorLabel.removeAttribute('hidden');
                errorLabel.style.display = 'block';
                errorLabel.innerHTML = errorMessage;
            });

        });
});

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




