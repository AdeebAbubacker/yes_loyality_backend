$("#CommonForm").validate({
    rules: {
        name: {
            required: true,
        },
        email: {
            required: true,
            email: true
        },

        username: {
            required: true,
        },
        phone: {
            required: true,
            phoneUS: true
        },

        password: {
            required: true,
            minlength: 5
        },
        c_password: {
            required: true,
            minlength: 5,
            equalTo: "#password"
        },
    },
});
function displayError(field, message) {
    const errorElement = document.getElementById(field + 'Error');
    if (errorElement) {
        errorElement.innerText = message;
    } else {
        console.error('Error element not found for field: ' + field);
    }
}

// document.getElementById('CommonForm').addEventListener('submit', (Event) => {
//     Event.preventDefault();
//     if (!$("#CommonForm").valid())
//         return false;
//     const Form = Event.target;
//     const Data = new FormData(Form);
//     const FormAction = Form.getAttribute("action");
//     const Method = Form.getAttribute("method") ?? "GET";
//     // const Object = {};
//     // Data.forEach((value, key) => Object[key] = value);

//     axios({
//         method: Method,
//         url: FormAction,
//         data: Data,
//         // headers: Headers,
//     })
//         .then(response => {
//             const Toast = Swal.mixin({
//                 toast: true,
//                 position: "top-end",
//                 showConfirmButton: false,
//                 timer: 3000,
//                 timerProgressBar: true,
//                 didOpen: (toast) => {
//                     toast.onmouseenter = Swal.stopTimer;
//                     toast.onmouseleave = Swal.resumeTimer;
//                 }
//             });
//             Toast.fire({
//                 icon: "success",
//                 title: "User Registered successfully"
//             });
//             Form.reset();
//         })
//         .catch(error => {
//             const errorData = error.response.data.data;
//             // Check if errorData contains email or username errors
//             if (errorData.hasOwnProperty('email')) {
//                 displayError('email', errorData.email[0]);
//             }
//             if (errorData.hasOwnProperty('username')) {
//                 displayError('username', errorData.username[0]);
//             }
//         });
// });
