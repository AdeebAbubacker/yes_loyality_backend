<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="{{ asset('2_AdminPanel/libs/gridjs/gridjs.umd.js') }}"></script>
{{-- <script src="{{ asset("2_AdminPanel/js/pages/gridjs.init.js") }}"></script> --}}
<script src="{{ asset('2_AdminPanel/libs/sweetalert2/sweetalert2.min.js') }}"></script>
{{-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> --}}
{{-- <script src="https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js"></script> --}}

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

<script src="{{ asset('2_AdminPanel/libs//bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('2_AdminPanel/libs//simplebar/simplebar.min.js') }}"></script>
<script src="{{ asset('2_AdminPanel/libs//node-waves/waves.min.js') }}"></script>
<script src="{{ asset('2_AdminPanel/libs//feather-icons/feather.min.js') }}"></script>
<script src="{{ asset('2_AdminPanel/js/pages/plugins/lord-icon-2.1.0.js') }}"></script>
<script src="{{ asset('2_AdminPanel/js/onscan.min.js') }}"></script>
<script src="{{ URL::asset('2_AdminPanel/libs/cleave.js/cleave.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/libphonenumber-js/1.11.3/libphonenumber-js.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>






<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/toastify-js'></script>
<script type='text/javascript' src='{{ asset('2_AdminPanel/libs/choices.js/public/assets/scripts/choices.min.js') }}'>
</script>
<script type='text/javascript' src='{{ asset('2_AdminPanel/libs/flatpickr/flatpickr.min.js') }}'></script>

<script src="{{ asset('2_AdminPanel/js/app.js') }}"></script>

{{-- jQuery Plugins & Functions --}}
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/intl-tel-input@23.0.4/build/js/intlTelInput.min.js"></script>
<script src="{{ asset('0_Common/2_functions.js') }}"></script>
{{-- !! jQuery Plugins & Functions !! --}}



@if (is_file(public_path('2_AdminPanel/PageConfigs/' . PageName() . '.js')))
    <script src="{{ asset('2_AdminPanel/PageConfigs/' . PageName() . '.js') }}"></script>
@endif

@stack('FooterScripts')

{{-- <script src="{{ asset("2_AdminPanel/js/plugins.js") }}"></script> --}}


<!--  Vuelidate -->
{{-- <script src="https://cdn.jsdelivr.net/npm/vue-demi"></script>
<script src="https://cdn.jsdelivr.net/npm/@vuelidate/core"></script>
<script src="https://cdn.jsdelivr.net/npm/@vuelidate/validators"></script> --}}
