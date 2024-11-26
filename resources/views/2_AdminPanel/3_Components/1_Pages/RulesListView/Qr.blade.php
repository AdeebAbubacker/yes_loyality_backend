
<form action="" method="POST" id="CommonForm" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{ $RuleId ?? null }}">
    <div class="row g-3">
        @forelse ($qr_codes as $qr_code)
            <div class="col-lg-6 d-flex flex-column">
                <div class="d-flex justify-content-center">
                    <a href="data:image/png;base64, {{ $qr_code->qr_image }}" download="LoyaltyQR_{{ $qr_code->qr_date }}_{{ $qr_code->store_name }}_{{ $qr_code->cashier_name }}_{{ $qr_code->qr_id }}">
                        <img src="data:image/png;base64, {{ $qr_code->qr_image }}" alt=""
                            class="rounded avatar-xl material-shadow">
                    </a>
                </div>
                {{-- <div class="d-flex justify-content-center"> --}}
                <div class="">
                    <p class="text fw-medium text-muted text-truncate mb-0 mt-1">{{ $qr_code->cashier_name }}</p>
                    <p class="text fw-medium text-muted mb-0 mt-1 text-break">{{ $qr_code->qr_id }}</p>
                </div>
            </div>
        @empty
        <div class="col-lg-12 d-flex flex-column">
            <div class="d-flex justify-content-center">
                <!-- Danger Alert -->
                <div class="alert alert-danger material-shadow" role="alert">
                    No QR codes generated.
                </div>
            </div>
        </div>
        @endforelse
        <div class="col-lg-12">
            <div class="hstack gap-2 justify-content-end">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
</form>
