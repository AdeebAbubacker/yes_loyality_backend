
document.addEventListener("DOMContentLoaded", function () {
    axios({
        method: 'get',
        url: '/admin/loyality-offer/rules',
    })
        .then(response => {

            var loyality_rules = response.data.data;
            localStorage.setItem("loyality_rules", null);
            localStorage.setItem("loyality_rules", loyality_rules);
            var rules = localStorage.getItem("loyality_rules");

        })
});

document.getElementById('RefreshBtn').addEventListener('click', function () {
    location.reload();
});

$("#loyality-form").validate({
    rules: {
        store_name: {
            required: true
        },
        cashier_name: {
            required: true
        },
        user_name: {
            required: true
        },
        invoice_no: {
            // required: true,
            number: true,
            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
        },
        invoice_cost: {
            required: true,
            number: true,
            pattern: /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/
        },
    },
    messages: {
        invoice_no: {
            pattern: "Please enter a valid number",
        },
        invoice_cost: {
            pattern: "Please enter a value greater than or equal to 0.",
        },
        cashier_name: {
            required: "Please Select a cashier.",
        },
        user_name: {
            required: "Please Select a User.",
        },
        store_name: {
            required: "Please Select a Store.",
        }
    },
});

var userSelect = document.getElementById('user_name');
var invoiceNoInput = document.getElementById('invoice_no');
var invoiceCostInput = document.getElementById('invoice_cost');
var AlertSection = document.getElementById('Alert-section');


userSelect.addEventListener('change', function () {
    if (userSelect.value) {
        invoiceNoInput.disabled = false;
        invoiceCostInput.disabled = false;
        AlertSection.setAttribute('hidden', '');
    } else {
        invoiceNoInput.disabled = true;
        invoiceNoInput.value = '';
        invoiceCostInput.disabled = true;
        invoiceCostInput.value = '';
        AlertSection.removeAttribute('hidden');
    }
});


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

function renderUserSelect(users) {
    // Find the parent element where the select will be appended
    const selectContainer = document.getElementById('cashier_select_container');

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
        option.textContent = user.customer_id + ' -' + user.name;
        userSelect.appendChild(option);
    });

    // Append the select element to the container
    selectContainer.appendChild(userSelect);
    initChoices();
}

var user_balance = null;
document.getElementById('user_name').addEventListener('change', function () {

    var UserId = this.value;

    const invoice_cost = document.getElementById('invoice_cost');
    const invoice_number = document.getElementById('invoice_no');
    const point_acquired = document.getElementById('point_acquired');
    const final_cost = document.getElementById('final_cost');
    const cost_reduced = document.getElementById('cost_reduced');
    const total_points = document.getElementById('balance_points');

    document.getElementById('offer-section').setAttribute('hidden', '');


    invoice_cost.value = "";
    invoice_number.value = "";
    point_acquired.value = 0;
    final_cost.value = 0;
    cost_reduced.value = 0;
    total_points.value = 0;

    const selectedelement = document.getElementById('user_info');

    if (!UserId) {
        selectedelement.innerHTML = ``;
    } else {
        axios({
            method: 'get',
            url: '/admin/customer/info',
            params: {
                customer_id: UserId
            }
        })
            .then(response => {

                const user_details = response.data.data;

                // const button = document.getElementById('SubmitBtn');
                const total_points = document.getElementById('balance_points');
                total_points.value = user_details[0].wallet_balance;
                user_balance = user_details[0].wallet_balance;
                // button.removeAttribute('hidden');
                selectedelement.innerHTML = `
                                        <div class="card mb-0">
                                            <div class="card-header">
                                                <h6 class="form-label mb-0 ">User Details</h6>
                                            </div>
                                            <div class="card-body p-2 text-center">
                                                <div class="row d-flex align-items-center">
                                                    <div class="col-4">
                                                    ${user_details[0].image ? `<img src="/storage/file_uploads/user/${user_details[0].id}/${user_details[0].image}" alt=""
                                                    class="img-fluid rounded-circle">` : `<img src="/2_AdminPanel/images/users/user-dummy-img.jpg" alt="Default Avatar" class="img-fluid rounded-circle">`}
                                                    </div>
                                                    <div class="col-8">
                                                        <h5 class="card-title text-start">${user_details[0].name}</h5>
                                                        <p class="text-muted mb-1 d-flex justify-content-start">Total Points - <span
                                                                class="badge bg-warning">${user_details[0].wallet_total}</span></p>
                                                        <p class="text-muted mb-1 d-flex justify-content-start">Used Points - <span
                                                                class="badge bg-danger">${user_details[0].wallet_used}</span></p>
                                                        <p class="text-muted mb-1 d-flex justify-content-start">Balance Points - <span
                                                                class="badge bg-success">${user_details[0].wallet_balance}</span></p>
                                                    </div>
                                                </div>
    
                                            </div>
                                        </div>`;


            });
    }




});


var previousOfferId = null;
var actual_points = null;
var actual_final_cost = null;


function selectOffer(OfferId) {
    changeStyle(OfferId);

    var offer_points = document.getElementById('offer_points-' + OfferId);
    var points_utilized = document.getElementById('point_utilized');
    var final_cost = document.getElementById('final_cost');
    var point_acquired = document.getElementById("point_acquired");
    var cost_reduced = document.getElementById("cost_reduced");
    var balance_points = document.getElementById("balance_points");
    var invoice_cost = document.getElementById("invoice_cost");
    var PointRules = document.getElementById('PointRules');
    var BreakageCost = document.getElementById('BreakageCost');
    var offer_id = document.getElementById('offer_id');



    var ElementPointAquired = document.getElementById('Points-Acquired');
    var ElementPointUtilized = document.getElementById('Points-Utilized');

    if (OfferId === previousOfferId) {
        ElementPointAquired.removeAttribute('hidden');
        ElementPointUtilized.setAttribute('hidden', '');
        PointRules.removeAttribute('hidden');

        balance_points.value = parseFloat(user_balance) + parseFloat(point_acquired.value);
        final_cost.value = invoice_cost.value;
        cost_reduced.value = 0;
        offer_id.value = null;

        BreakageCost.innerHTML = "";
        BreakageCost.removeAttribute('hidden');
        var table = `<div class="card-body">
                            <div>
                                <h6 class="form-label mb-1">Breakage Cost</h6>
                                <hr>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Breakage</th>
                                            <th scope="col">Details</th>
                                            <th scope="col">Value</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Invoice Cost</td>
                                            <td>-- --</td>
                                            <td>${invoice_cost.value}</td>
                                        </tr>
                                        <tr>
                                                <td>Added Offer</td>
                                                <td>--  --</td>
                                                <td>--  --</td>
                                            </tr>
                                        <tr>
                                            <td>Points</td>
                                            <td>Points Credited</td>
                                            <td>${point_acquired.value} </td>
                                        </tr>
                                        <tr>
                                            <td>Final Cost</td>
                                            <td>0 Rs Reduced</td>
                                            <td>${final_cost.value} </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>`;

        BreakageCost.innerHTML = table;

        previousOfferId = null;

    } else {

        ElementPointAquired.setAttribute('hidden', '');
        ElementPointUtilized.removeAttribute('hidden');

        points_utilized.value = offer_points.value;
        // point_acquired.value = 0;
        balance_points.value = user_balance;
        balance_points.value = balance_points.value - points_utilized.value;
        offer_id.value = OfferId;

        OfferDetail(OfferId)
            .then(offer => {
                // console.log("offer:", offer);

                if (actual_final_cost !== null) {
                    final_cost.value = actual_final_cost - ReducedCost(offer, actual_final_cost);
                    cost_reduced.value = ReducedCost(offer, actual_final_cost);
                } else {
                    actual_final_cost = final_cost.value;
                    final_cost.value = actual_final_cost - ReducedCost(offer, actual_final_cost);
                    cost_reduced.value = ReducedCost(offer, actual_final_cost);

                }
                BreakageCost.innerHTML = "";
                BreakageCost.removeAttribute('hidden');
                var detail = null;
                if (offer.discount_type == 'percent') {
                    detail = `${offer.discount_val}% Off`
                } else {
                    detail = `Flat ${offer.discount_val}.Rs Off`
                }
                var table = `<div class="card-body">
                            <div>
                                <h6 class="form-label mb-1">Breakage Cost</h6>
                                <hr>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Breakage</th>
                                            <th scope="col">Details</th>
                                            <th scope="col">Value</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Invoice Cost</td>
                                            <td>-- --</td>
                                            <td>${actual_final_cost}</td>
                                        </tr>
                                        <tr>
                                                <td>Added Offer</td>
                                                <td>${detail} <br>
                                                    Max-Reduction: ${offer.max_reduction}                                                
                                                </td>
                                                <td> ${offer.points_required}</td>
                                            </tr>
                                        <tr>
                                            <td>Points</td>
                                            <td>Points Debited</td>
                                            <td>${points_utilized.value} </td>
                                        </tr>
                                        <tr>
                                            <td>Final Cost</td>
                                            <td>${cost_reduced.value} Rs Reduced</td>
                                            <td>${final_cost.value} </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>`;
                BreakageCost.innerHTML = table;
                PointRules.setAttribute('hidden', '');
            });
        previousOfferId = OfferId;
    }


}
function OfferDetail(OfferId) {

    return axios({
        method: 'get',
        url: '/admin/loyality-offer/info',
        params: {
            offer_id: OfferId
        }
    })
        .then(response => {
            const offer = response.data.data;
            return offer;
        })
        .catch(error => {
            // console.error('Error fetching loyalty rules:', error);
            return 0;
        });
}

function ReducedCost(offer, actual_final_cost) {
    var reduced_cost = null;
    if (offer.discount_type == 'percent') {
        reduced_cost = actual_final_cost * (offer.discount_val / 100);
    } else if (offer.discount_type == 'amount') {
        reduced_cost = actual_final_cost - offer.discount_val;
    }
    if (reduced_cost >= offer.max_reduction && offer.max_reduction != null) {
        reduced_cost = offer.max_reduction
    }
    return reduced_cost;
}

function changeStyle(offerId) {
    const label = document.getElementById(`offer-${offerId}`);
    const alertDiv = label.querySelector('.alert');

    // Toggle between alert-danger and alert-success classes
    alertDiv.classList.toggle('alert-danger');
    alertDiv.classList.toggle('alert-success');

    // Toggle between text-danger and text-success classes for fs-18 and btn elements
    label.querySelector('.fs-18').classList.toggle('text-danger');
    label.querySelector('.fs-18').classList.toggle('text-success');
    label.querySelector('.btn').classList.toggle('text-danger');
    label.querySelector('.btn').classList.toggle('text-success');

    // Loop through all offers and reset their styles to danger except the selected one
    document.querySelectorAll('.royalty-offer').forEach(Offer => {
        const currentOfferId = parseInt(Offer.getAttribute('data-offer-id'));
        if (currentOfferId !== offerId) {
            const alertDiv = Offer.querySelector('.alert');
            alertDiv.classList.remove('alert-success');
            alertDiv.classList.add('alert-danger');
            Offer.querySelector('.fs-18').classList.remove('text-success');
            Offer.querySelector('.fs-18').classList.add('text-danger');
            Offer.querySelector('.btn').classList.remove('text-success');
            Offer.querySelector('.btn').classList.add('text-danger');
        }
    });
}

// function changeStyle(offerId, className) {
//     var selectedElement = document.getElementById('offer-' + offerId);
//     var innerHTML = selectedElement.innerHTML;
//     var updatedHTML = null;
//     if (className === "success") {
//         console.log(innerHTML)
//         var updatedHTML = innerHTML.replaceAll("danger", className);
//         selectedElement.innerHTML = updatedHTML;
//     }else{
//         console.log(innerHTML)
//         var updatedHTML = innerHTML.replaceAll("success", className);
//         selectedElement.innerHTML = updatedHTML;
//     }

// }


document.getElementById('invoice_cost').addEventListener('input', function () {
    const final_cost = document.getElementById("final_cost");
    const invoice_cost = document.getElementById("invoice_cost");
    const point_acquired = document.getElementById("point_acquired");
    const balance_points = document.getElementById("balance_points");
    const offer_id = document.getElementById('offer_id');
    var ElementPointAquired = document.getElementById('Points-Acquired');
    var ElementPointUtilized = document.getElementById('Points-Utilized');

    offer_id.value = null;
    previousOfferId = null;
    ElementPointAquired.removeAttribute('hidden');
    ElementPointUtilized.setAttribute('hidden', '');
    balance_points.value = user_balance;

    final_cost.value = invoice_cost.value;

    points_claimed(invoice_cost.value)
        .then(points => {
            // console.log("Points received:", points);
            point_acquired.value = points;
            balance_points.value = parseFloat(balance_points.value) + parseFloat(point_acquired.value);

            const BreakageCost = document.getElementById('BreakageCost');
            // console.log(point_acquired.value);
            BreakageCost.innerHTML = "";
            BreakageCost.removeAttribute('hidden');
            var table = `<div class="card-body">
                            <div>
                                <h6 class="form-label mb-1">Breakage Cost</h6>
                                <hr>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Breakage</th>
                                            <th scope="col">Details</th>
                                            <th scope="col">Value</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Invoice Cost</td>
                                            <td>-- --</td>
                                            <td>${invoice_cost.value}</td>
                                        </tr>
                                        <tr>
                                                <td>Added Offer</td>
                                                <td>--  --</td>
                                                <td>--  --</td>
                                            </tr>
                                        <tr>
                                            <td>Points</td>
                                            <td>Points Credited</td>
                                            <td>${point_acquired.value} </td>
                                        </tr>
                                        <tr>
                                            <td>Final Cost</td>
                                            <td>0 Rs Reduced</td>
                                            <td>${final_cost.value} </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>`;

            BreakageCost.innerHTML = table;
            const PointRules = document.getElementById('PointRules');
            PointRules.removeAttribute('hidden');
        });



});


function points_claimed(amount) {

    return axios({
        method: 'get',
        url: '/admin/loyality-offer/rules',
    })
        .then(response => {
            const loyalty_rules = response.data.data;
            var points = 0;
            // console.log(amount)
            for (const rule of loyalty_rules) {
                if (amount >= rule.min_amt) {
                    points = rule.point_received;
                }
            }
            return points;
        })
        .catch(error => {
            // console.error('Error fetching loyalty rules:', error);
            return 0;
        });
}



document.getElementById('invoice_cost').addEventListener('input', OfferSection);
document.getElementById('user_name').addEventListener('input', OfferSection);

function OfferSection() {
    const invoice_cost = document.getElementById("invoice_cost").value;
    const balance_points = document.getElementById("balance_points").value;
    const cashier_id = document.getElementById("cashier_name").value;
    const store_id = document.getElementById("store_name").value;

    // console.log(cashier_id)

    if ((invoice_cost != "")) {
        if ((user_name != "")) {
            document.getElementById('offer-section').removeAttribute('hidden');
            const button = document.getElementById('SubmitBtn');
            button.removeAttribute('hidden');

            axios({
                method: 'get',
                url: '/admin/loyality-offer/offer-list',
                params: {
                    invoice_cost: invoice_cost,
                    balance_points: balance_points,
                    cashier_id: cashier_id,
                    store_id: store_id
                }
            })
                .then(response => {
                    var offer_list = response.data.data;
                    var offerContainer = document.getElementById("inner-offer");
                    // console.log(offer_list)
                    if (response.data.count == 0) {
                        // document.getElementById('offer-section').setAttribute('hidden', '');
                        // offerContainer.innerHTML = "";
                        offerContainer.innerHTML = `<div class="col-12">
                                        <div class="alert alert-danger material-shadow" role="alert p-0 mb-0 justify-content-between">
                                            <i class="bx bxs-offer"></i> Offers not available for this user
                                        </div>
                                    </div>`;
                    } else {
                        offerContainer.innerHTML = "";
                        offer_list.forEach(function (offer) {
                            var offerHTML = `
                            <label class="col-sm-6 royalty-offer" data-offer-id="${offer.id}" for="offer_${offer.id}" id="offer-${offer.id}">
                                <div class="offer-content alert border-dashed alert-danger" role="alert">
                                    <div class="d-flex align-items-start">
                                        <div class="ms-2">
                                            <i class="bx bx-check-circle fs-22"></i>
                                            <h4 class="fs-18 text-danger fw-semibold">${offer.name}</h4>
                                            <p class="text-body mb-1">${offer.comments}<br><span class="fw-semibold">${offer.min_inv_amt}</span></p>
                                            <input type="number" id="offer_points-${offer.id}" value="${offer.points_required}" hidden />
                                            <button type="button" onclick="selectOffer(${offer.id})" class="btn ps-0 btn-sm material-shadow-none text-danger text-uppercase">SELECT OFFER</button>
                                        </div>
                                    </div>
                                </div>
                                <input type="radio" id="offer_${offer.id}" name="offer" value="${offer.id}" hidden />
                            </label>
                        `;

                            offerContainer.innerHTML += offerHTML;
                        });
                    }
                })
        }
    } else {

    }
}

// function selectOffer(offer_id){
//     const offerButtons = document.querySelectorAll('.royalty-offer button');

//     let selectedOfferId = null;

//     offerButtons.forEach(button => {
//         button.addEventListener('click', function() {
//             const offerId = button.closest('.royalty-offer').dataset.offerId;

//             // Deselect the offer if it's already selected
//             if (selectedOfferId === offerId) {
//                 deselectOffer(offerId);
//                 selectedOfferId = null;
//             } else {
//                 // Deselect the previously selected offer
//                 if (selectedOfferId !== null) {
//                     deselectOffer(selectedOfferId);
//                 }
//                 // Select the new offer
//                 selectOffer(offerId);
//                 selectedOfferId = offerId;
//             }
//         });
//     });

//     function selectOffer(offerId) {
//         const offerElement = document.querySelector(`.royalty-offer[data-offer-id="${offerId}"]`);
//         offerElement.classList.add('selected');
//         const radioInput = offerElement.querySelector('input[type="radio"]');
//         radioInput.checked = true;
//     }

//     function deselectOffer(offerId) {
//         const offerElement = document.querySelector(`.royalty-offer[data-offer-id="${offerId}"]`);
//         offerElement.classList.remove('selected');
//         const radioInput = offerElement.querySelector('input[type="radio"]');
//         radioInput.checked = false;
//     }
// }

document.getElementById('loyality-form').addEventListener('submit', (Event) => {
    Event.preventDefault();
    if (!$("#loyality-form").valid())
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

            Swal.fire({
                html: '<div class="mt-3">' +
                    '<lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon>' +
                    '<div class="mt-4 pt-2 fs-15">' +
                    `<h4>${response.data.message}</h4>` +
                    '<p class="text-muted mx-4 mb-0">Transaction Added Successfully.</p>' +
                    '</div>' +
                    '</div>',
                showCancelButton: true,
                showConfirmButton: false,
                cancelButtonClass: 'btn btn-primary w-xs mb-1',
                cancelButtonText: 'Back',
                buttonsStyling: false,
                didClose: () => {
                    reload();
                }
            })
        })
        .catch(error => {
            console.log(error.response.data);
            const errors = error.response.data.data;
            Object.keys(errors).forEach(field => {
                const errorMessage = errors[field][0];
                const labelField = document.getElementById(`${field}-error`);
                if (labelField) {
                    labelField.remove();
                }
                var label = document.createElement("label");
                label.id = `${field}-error`;
                label.className = "error";
                label.setAttribute("for", field);
                label.hidden = false;
                label.style.display = "block";
                label.innerHTML = errorMessage;
                const inputField = document.getElementById(field);
                inputField.parentElement.appendChild(label);
            });
        });
});

function reload() {
    location.reload();
}


var selectElement = document.getElementById('user_name');

var choices = new Choices(selectElement);



$("#AddDataModelToggle").click(function () {
    OpenModel({
        // These are the defaults.
        Data: '/admin/loyality-offer/add/user',
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
                        phone: {
                            required: true,
                        },
                    },
                    messages: {
                        name: {
                            required: "Please enter your name",
                        },
                        email: {
                            required: "Please enter your email",
                            email: "Please enter a valid email address",
                            pattern: "Please enter a valid email address",
                        },
                        phone: {
                            required: "Please enter your phone number",
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
                document.getElementById('CommonForm').addEventListener('submit', (Event) => {
                    Event.preventDefault();
                    if (!$("#CommonForm").valid())
                        return false;
                    const Form = Event.target;
                    const Data = new FormData(Form);
                    const FormAction = Form.getAttribute("action");
                    const Method = Form.getAttribute("method") ?? "GET";

                    axios({
                        method: Method,
                        url: FormAction,
                        data: Data,
                    })
                        .then(response => {
                            const customer_data = response.data.data;

                            $("#CommonModel").modal("hide");

                            const Toast = Swal.mixin({
                                toast: true,
                                position: "top-end",
                                showConfirmButton: false,
                                timer: 2000,
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
                            choices.setChoices([{
                                value: customer_data.customer_id,
                                label: `${customer_data.customer_id} - ` + (customer_data.phone ?? customer_data.name),
                                selected: true,
                                disabled: false,
                                maxItemCount: 5,
                            }], 'value', 'label', true).setChoiceByValue(customer_data.customer_id);
                        })
                        .catch(error => {
                            // console.log(error.response.data);
                            const errors = error.response.data.data;
                            Object.keys(errors).forEach(field => {
                                const errorMessage = errors[field][0];
                                const errorLabel = document.getElementById(`${field}-error`);
                                errorLabel.style.display = 'block';
                                errorLabel.innerHTML = errorMessage;
                            });
                        });
                });

            },
            Failure: (response) => { },
        },
    });
});

onScan.attachTo(document);
// Register event listener
document.addEventListener('scan', async function (sScancode) {
    // Destroy Choices
    choices.destroy();

    // console.log(sScancode.detail.scanCode);
    var scannedString = sScancode.detail.scanCode;

    //converting to json
    var scannedData = convertStringToJson(scannedString);

    const isValid = await isValidScanData(scannedData.value);

    if (isValid) {
        // Process the scanned data here
        focusAndSelectOption(scannedData.value);

    } else {
        // Handle invalid scan data (e.g., display an error message)
        Swal.fire({
            html: '<div class="mt-3">' +
                '<lord-icon src="https://cdn.lordicon.com/tdrtiskw.json" trigger="loop" colors="primary:#f06548,secondary:#f7b84b" style="width:120px;height:120px"></lord-icon>' +
                '<div class="mt-4 pt-2 fs-15">' +
                '<h4>Oops...! Something went Wrong !</h4>' +
                '<p class="text-muted mx-4 mb-0">No user found with the provided QR.</p>' +
                '</div>' +
                '</div>',
            showCancelButton: true,
            showConfirmButton: false,
            cancelButtonClass: 'btn btn-primary w-xs mb-1',
            cancelButtonText: 'Dismiss',
            buttonsStyling: false,

        });
        // Change Value to Default
        selectElement.selectedIndex = "";
        // Removing User Section
        const selectedelement = document.getElementById('user_info');
        selectedelement.innerHTML = "";
        // Reintialize Choices
        choices = new Choices(selectElement);
    }
});


// Function to check if the scanned data is valid
async function isValidScanData(data) {
    try {
        const response = await axios.get('/admin/users/userExist', {
            params: {
                customer_id: data
            }
        });

        // console.log(response.data.user_exists);

        return response.data.user_exists === true;
    } catch (error) {
        console.error("Something went wrong:", error);
        return false; // or handle the error as needed
    }
}


function focusAndSelectOption(optionValue) {
    // Focus on the select element
    selectElement.focus();

    // Set the value of the select element to the desired option's value
    selectElement.value = optionValue;

    // Optionally, you can trigger a change event if needed
    var event = new Event('change');
    selectElement.dispatchEvent(event);

    // Reintialize Choices
    choices = new Choices(selectElement);
}

// function convertStringToJson(scannedString) {
//     // Extract parts from the string
//     let typeIndex = scannedString.indexOf('type');
//     let valueIndex = scannedString.indexOf('value');

//     if (typeIndex !== -1 && valueIndex !== -1 && valueIndex > typeIndex) {
//         let type = scannedString.substring(typeIndex + 4, valueIndex); // Extract "user"
//         let value = scannedString.substring(valueIndex + 5); // Extract "510142"

//         return {
//             type: type,
//             value: parseInt(value, 10)
//         };
//     } else {
//         throw new Error('Scanned data does not match expected pattern');
//     }
// }

function convertStringToJson(scannedString) {
    // Extract parts from the string
    if (typeof scannedString === 'string') {
        var qrData = scannedString;
        const qrDataArray_1 = qrData.split("##");
        var qrData = {};

        for (var key in qrDataArray_1) {
            let qrDataArray_2 = qrDataArray_1[key].split("#");
            qrData[qrDataArray_2[0]] = qrDataArray_2[1];
        }

        return qrData;
    } else {
        throw new Error('Scanned data does not match expected pattern');
    }

}



