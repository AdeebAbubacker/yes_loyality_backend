@extends('2_AdminPanel.1_Layouts.2_MinimalLayout')
@section('title')
    Get Support
@endsection
@section('content')
    <div class="auth-page-wrapper pt-5">
        <!-- auth page bg -->
        <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
            <div class="bg-overlay"></div>

            <div class="shape">
                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink"
                    viewBox="0 0 1440 120">
                    <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                </svg>
            </div>
        </div>

        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center mt-sm-5 mb-4 text-white-50">
                            <div>
                                <a href="" class="d-inline-block auth-logo">
                                    <img src="{{ URL::asset('2_AdminPanel/images/YL-logo.png') }}" alt=""
                                        height="90">
                                </a>
                            </div>
                            {{-- <p class="mt-3 fs-15 fw-medium">Premium Admin & Dashboard Template</p> --}}
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4">

                            <div class="card-body p-4">
                                <div class="text-center mt-2">
                                    <h5 class="text-primary">Get Support</h5>
                                    {{-- <p class="text-muted">Reset password with velzon</p> --}}

                                    {{-- <lord-icon src="https://cdn.lordicon.com/rhvddzym.json" trigger="loop"
                                        colors="primary:#0ab39c" class="avatar-xl">
                                    </lord-icon> --}}

                                </div>

                                {{-- <div class="alert alert-borderless alert-warning text-center mb-2 mx-2" role="alert">
                                    Enter your email and instructions will be sent to you!
                                </div> --}}
                                <div class="p-2">
                                    <form id="get-support" action="{{ route('SupportForm') }}" method="POST" enctype="multipart/form-data">
                                        <div class="mb-4">
                                            <label for="name" class="form-label">Name<span class="required-indicator">*</span></label>
                                        <input type="text" class="form-control" placeholder="Enter your Name"
                                            name="name" id="name">
                                        </div>
                                        <div class="mb-4">
                                            <label for="email" class="form-label">Email<span class="required-indicator">*</span></label>
                                        <input type="email" class="form-control" placeholder="Enter your Email"
                                            name="email" id="email">
                                        </div>
                                        <div class="mb-4">
                                            <label for="subject" class="form-label">Subject<span class="required-indicator">*</span></label>
                                        <textarea type="text" class="form-control" placeholder="Enter Subject" name="subject" id="subject"></textarea>
                                        </div>
                                        <div class="mb-4">
                                            <label for="message" class="form-label">Message<span class="required-indicator">*</span></label>
                                        <textarea type="text" class="form-control" placeholder="Enter Message" name="message" id="message"></textarea>
                                        </div>

                                        <div class="text-center mt-4">
                                            <button class="btn btn-success w-100" type="submit">Submit</button>
                                        </div>
                                    </form><!-- end form -->
                                </div>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->

                        <div class="mt-4 text-center">
                            <p class="mb-0">Wait, I remember my password... <a href="{{ route('LoginView') }}"
                                    class="fw-semibold text-primary text-decoration-none"> Click here </a> </p>
                        </div>

                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end auth page content -->

        <!-- footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <p class="mb-0 text-muted">&copy; {{ date('Y') }} Designed & Developed by <a
                                    href="https://agatebc.com/" target="_blank" rel="noopener noreferrer">Agate Business
                                    Consulting</a></p>

                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->
    </div>
    <!-- end auth-page-wrapper -->
@endsection
@section('script')
    <script src="{{ URL::asset('2_AdminPanel/libs/particles.js/particles.js') }}"></script>
    <script src="{{ URL::asset('2_AdminPanel/js/pages/particles.app.js') }}"></script>
@endsection