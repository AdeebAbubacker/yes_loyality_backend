$("#get-support").validate({
    rules: {
        name: {
            required: true,
            pattern: /^[a-zA-Z\s]+$/
        },
        email: {
            required: true,
            email: true,
            pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
        },
        subject: {
            required: true,
            maxlength: 200,
        },
        message: {
            required: true,
            maxlength: 500,
        }

    },
    messages: {
        email: {
            pattern: "Please enter a valid email address"
        },
        name: {
            pattern: "Please enter a valid name"
        },
    },
});

// document.getElementById('get-support').addEventListener('submit', (Event) => {
//     Event.preventDefault();
//     if (!$("#get-support").valid())
//         return false;
//     const Form = Event.target;
//     const Data = new FormData(Form);
//     const FormAction = Form.getAttribute("action");
//     const Method = Form.getAttribute("method") ?? "GET";

//     console.log(FormAction)

//     axios({
//         method: Method,
//         url: FormAction,
//         data: Data,
//     })
//         .then(response => {
//             Swal.fire({
//                 title: 'Your request has been successfully submitted!',
//                 // text: 'Thank You For Contacting Us.',
//                 icon: 'success',
//                 showCancelButton: true,
//                 showConfirmButton: false,
//                 cancelButtonClass: 'btn btn-primary w-xs mb-1',
//                 cancelButtonText: 'Back',
//                 buttonsStyling: false,
//                 didClose: () => {
//                     location.reload();
//                 }
//             })
//         })
//         .catch(error => {
//         });
// });


document.getElementById('get-support').addEventListener('submit', (event) => {
    event.preventDefault();
    
    // Validate form using jQuery Validation Plugin
    if (!$("#get-support").valid()) {
        return false;
    }

    const form = event.target;
    const formData = new FormData(form);
    const formAction = form.getAttribute("action");
    const method = form.getAttribute("method") || "POST";

    // Show loading dialog before making Axios request
    Swal.fire({
        title: 'Processing your request...',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
            axios({
                method: method,
                url: formAction,
                data: formData,
            })
                .then(response => {
                    // Replace loading dialog with success message
                    Swal.fire({
                        title: 'Your request has been successfully submitted!',
                        icon: 'success',
                        showCancelButton: true,
                        showConfirmButton: false,
                        cancelButtonClass: 'btn btn-primary w-xs mb-1',
                        cancelButtonText: 'Back',
                        buttonsStyling: false,
                        didClose: () => {
                            location.reload(); // Reload the page after closing the dialog
                        }
                    });
                })
                .catch(error => {
                    Swal.fire({
                        title: 'Oops... Something went wrong!',
                        text: 'Please try again later.',
                        icon: 'error',
                    });
                })
                .finally(() => {
                    Swal.hideLoading(); // Hide loading animation
                });
        }
    });
});