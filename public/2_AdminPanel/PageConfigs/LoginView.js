$("#CommonForm").validate({
    rules: {
        email: {
            required: true,
            email: true
        },
        password: {
            required: true,
            minlength: 5
        }
    },
});


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
//             window.location.href = "http://cyberfortnew/admin/dashboard";
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
//                 title: "User Login successfully"
//             });
//             Form.reset();
//         })
//         .catch(error => {
            
//         });
// });
