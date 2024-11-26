@php
    $TransactionEdit = isset($Transaction) ?? 0;
    if ($TransactionEdit):
        $route = 'EditTransactions';
        $TransactionId = $Transaction->id;
        $TransactionUserId = $Transaction->user_id;
        $UserId = $Transaction->user_pid;
        $TransactionCustomerId = $Transaction->customer_id;
        $TransactionUserName = $Transaction->username;
        $TransactionPhone = $Transaction->phone;
        $TransactionStoreId = $Transaction->store_id;
        $TransactionStoreName = $Transaction->storename;
        $TransactionCashierId = $Transaction->cashier_id;
        $TransactionCashierName = $Transaction->cashiername;
        $TransactionInvoiceNo = $Transaction->invoice_no;
        $TransactionInvoiceCost = $Transaction->invoice_amt;
        $TransactionCoinUtilized = $Transaction->coins;
        $TransactionCoinType = $Transaction->coin_type;
        $TransactionFinalCost = $Transaction->final_amt;
        $TransactionDate = $Transaction->created_at;

    else:
        $route = 'AddTransactions';
    endif;

    if (isset($readonly)):
        $disabled = 'disabled' ?? null;
        $hidden = 'hidden' ?? null;
    else:
    endif;
@endphp


<form action="{{ route($route) }}" method="POST" id="CommonForm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{ $TransactionId ?? null }}">
    <div class="row g-3">
        <div class="col-lg-6">
            <div>
                <label for="date_time" class="form-label">Date & Time</label>
                <input type="text" class="form-control" id="date_time" name="date_time"
                    placeholder="Enter Final Cost" value="{{ convert_date($TransactionDate) ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="store_name" class="form-label">Store</label>
                <select class="form-select" id="store_name" name="store_name" data-choices {{ $disabled ?? null }}>
                    <option value="{{ $TransactionStoreId ?? null }}">{{ $TransactionStoreName ?? 'Select Store' }}
                    </option>
                    @foreach ($stores as $store)
                        <option value="{{ $store->id }}">{{ $store->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-lg-6">
            <div id="user_select_container">
                <label for="cashier_name" class="form-label">Cashier Name</label>
                <select class="form-select" id="cashier_name" name="cashier_name" data-choices {{ $disabled ?? null }}>
                    <option value="{{ $TransactionCashierId ?? null }}">
                        {{ $TransactionCashierName ?? 'Choose a Store First' }}
                    </option>
                    @foreach ($users as $user)
                        <option value="{{ $user->id }}">{{ $user->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="user_name" class="form-label">User Name</label>
                <select class="form-select" id="user_id" name="user_id" data-choices {{ $disabled ?? null }}>
                    <option value="{{ $UserId ?? null }}">{{ $TransactionCustomerId ?? 'Select User' }}
                    </option>
                    @foreach ($users as $user)
                        <option value="{{ $user->customer_id }}">{{ $user->customer_id }} @if ($user->phone)
                                - {{ $user->phone }}
                            @endif
                        </option>
                    @endforeach

                </select>
            </div>
        </div>

        {{-- <div class="col-lg-6">
            <div>
                <label for="invoice_no" class="form-label">Invoice Number</label>
                <input type="text" class="form-control" id="invoice_no" name="invoice_no"
                    placeholder="Enter Invoice Number" value="{{ $TransactionInvoiceNo ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="invoice_amt" class="form-label">Invoice Cost</label>
                <input type="text" class="form-control" id="invoice_amt" name="invoice_amt"
                    placeholder="Enter Invoice Cost" value="{{ $TransactionInvoiceCost ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div> --}}
        <div class="col-lg-6">
            <div>
                <label for="coins" class="form-label">Points</label>
                <input type="text" class="form-control" id="coins" name="coins"
                    placeholder="Enter Coins Unilized" value="{{ $TransactionCoinUtilized ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div>
        <div class="col-lg-6">
            <div>
                <label for="coinn_type" class="form-label">Point Type</label>
                <select class="form-select" id="coinn_type" name="coin_type" data-choices {{ $disabled ?? null }}>
                    <option value="{{ $TransactionCoinType ?? null }}">{{ $TransactionCoinType ?? 'Select Type' }}
                    </option>
                    <option value="credit">credit</option>
                    <option value="debit">debit</option>
                </select>
            </div>
        </div>
        {{-- <div class="col-lg-6">
            <div>
                <label for="final_amt" class="form-label">Final Cost</label>
                <input type="text" class="form-control" id="final_amt" name="final_amt"
                    placeholder="Enter Final Cost" value="{{ $TransactionFinalCost ?? null }}"
                    {{ $disabled ?? null }} />
            </div>
        </div> --}}
        <!--end col-->
        <div class="col-lg-12">
            <div class="hstack gap-2 justify-content-end">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" {{ $hidden ?? null }}>Submit</button>
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
</form>
