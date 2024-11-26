@extends('2_AdminPanel.1_Layouts.2_MinimalLayout')

@section('title')
    Privacy Policy -
@endsection

@section('body')

    <body>
    @endsection
    @section('content')
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card">
                    <div class="bg-soft-warning position-relative">
                        <div class="card-body p-5">
                            <div class="text-center">
                                <h3>Privacy Policy</h3>
                                <p class="mb-0 text-muted">Last update: June 03, 2024
                                </p>
                            </div>
                        </div>
                        <div class="shape">
                            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink"
                                xmlns:svgjs="http://svgjs.com/svgjs" width="1440" height="60"
                                preserveAspectRatio="none" viewBox="0 0 1440 60">
                                <g mask="url(&quot;#SvgjsMask1001&quot;)" fill="none">
                                    <path d="M 0,4 C 144,13 432,48 720,49 C 1008,50 1296,17 1440,9L1440 60L0 60z"
                                        style="fill: var(--vz-card-bg-custom);"></path>
                                </g>
                                <defs>
                                    <mask id="SvgjsMask1001">
                                        <rect width="1440" height="60" fill="#ffffff"></rect>
                                    </mask>
                                </defs>
                            </svg>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="d-flex">
                            <div class="flex-shrink-0">
                                <i data-feather="check-circle" class="text-success icon-dual-success icon-xs"></i>
                            </div>
                            <div class="flex-grow-1">
                                {{-- <h5>Privacy Policy for YesYes Loyalty
                                </h5> --}}
                                <p class="text-muted">This Privacy Policy describes Our policies and procedures on the
                                    collection, use and disclosure of Your information when You use the Service and tells
                                    You about Your privacy rights and how the law protects You.</p>
                                <p class="text-muted">We use Your Personal data to provide and improve the Service. By using
                                    the Service, You agree to the collection and use of information in accordance with this
                                    Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy
                                    Generator.</p>
                                <h5>Interpretation and Definitions
                                </h5>
                                <p class="text-muted"><b>Interpretation</b></p>
                                <p class="text-muted">The words of which the initial letter is capitalized have meanings
                                    defined under the following conditions. The following definitions shall have the same
                                    meaning regardless of whether they appear in singular or in plural.</p>
                                <p class="text-muted"><b>Definitions</b></p>
                                <p class="text-muted">For the purposes of this Privacy Policy:</p>
                                <ul class="text-muted">
                                    <li>
                                        <p><strong>Account</strong> means a unique account created for You to access our
                                            Service or parts of our Service.</p>
                                    </li>
                                    <li>
                                        <p><strong>Affiliate</strong> means an entity that controls, is controlled by or is
                                            under common control with a party, where "control" means ownership of 50% or
                                            more of the shares, equity interest or other securities entitled to vote for
                                            election of directors or other managing authority.</p>
                                    </li>
                                    <li>
                                        <p><strong>Application</strong> refers to YesYes Loyalty, the software program
                                            provided by the Company.</p>
                                    </li>
                                    <li>
                                        <p><strong>Company</strong> (referred to as either "the Company", "We", "Us" or
                                            "Our" in this Agreement) refers to Yes Yes Indian Supermarket, Shop 2A/540,
                                            Derrimut Road, Tarneit 3029.</p>
                                    </li>
                                    <li>
                                        <p><strong>Country</strong> refers to: Victoria, Australia</p>
                                    </li>
                                    <li>
                                        <p><strong>Device</strong> means any device that can access the Service such as a
                                            computer, a cellphone or a digital tablet.</p>
                                    </li>
                                    <li>
                                        <p><strong>Personal Data</strong> is any information that relates to an identified
                                            or identifiable individual.</p>
                                    </li>
                                    <li>
                                        <p><strong>Service</strong> refers to the Application.</p>
                                    </li>
                                    <li>
                                        <p><strong>Service Provider</strong> means any natural or legal person who processes
                                            the data on behalf of the Company. It refers to third-party companies or
                                            individuals employed by the Company to facilitate the Service, to provide the
                                            Service on behalf of the Company, to perform services related to the Service or
                                            to assist the Company in analyzing how the Service is used.</p>
                                    </li>
                                    <li>
                                        <p><strong>Usage Data</strong> refers to data collected automatically, either
                                            generated by the use of the Service or from the Service infrastructure itself
                                            (for example, the duration of a page visit).</p>
                                    </li>
                                    <li>
                                        <p><strong>You</strong> means the individual accessing or using the Service, or the
                                            company, or other legal entity on behalf of which such individual is accessing
                                            or using the Service, as applicable.</p>
                                    </li>
                                </ul>
                                <h5 class="p-1">Collecting and Using Your Personal Data
                                </h5>
                                <h6 class="p-1"><strong>Types of Data Collected</strong></h6>
                                <p class="text-muted"><b>Personal Data</b></p>
                                <p class="text-muted">While using Our Service, We may ask You to provide Us with certain
                                    personally identifiable information that can be used to contact or identify You.
                                    Personally identifiable information may include, but is not limited to:</p>
                                <ul class="text-muted">
                                    <li>
                                        <p>Email address</p>
                                    </li>
                                    <li>
                                        <p>First name and last name</p>
                                    </li>
                                    <li>
                                        <p>Phone number</p>
                                    </li>
                                    <li>
                                        <p>Address, State, Province, ZIP/Postal code, City</p>
                                    </li>
                                    <li>
                                        <p>Usage Data</p>
                                    </li>
                                </ul>
                                <p class="text-muted"><b>Usage Data</b></p>
                                <p class="text-muted">Usage Data is collected automatically when using the Service.</p>
                                <p class="text-muted">Usage Data may include information such as Your Device's Internet
                                    Protocol address (e.g. IP address), browser type, browser version, the pages of our
                                    Service that You visit, the time and date of Your visit, the time spent on those pages,
                                    unique device identifiers and other diagnostic data.</p>

                                <p class="text-muted">When You access the Service by or through a mobile device, We may
                                    collect certain information automatically, including, but not limited to, the type of
                                    mobile device You use, Your mobile device unique ID, the IP address of Your mobile
                                    device, Your mobile operating system, the type of mobile Internet browser You use,
                                    unique device identifiers and other diagnostic data.</p>

                                <p class="text-muted">We may also collect information that Your browser sends whenever You
                                    visit our Service or when You access the Service by or through a mobile device.</p>

                                <p class="text-muted">We may collect certain information from your device in order to
                                    deliver push notifications, such as your device's unique token. We will not share this
                                    data with third parties without your consent, except as required by law.</p>

                                <p class="text-muted"><b>Information Collected while Using the Application</b></p>

                                <p class="text-muted">While using Our Application, in order to provide features of Our
                                    Application, We may collect, with Your prior permission:</p>

                                <ul class="text-muted">
                                    <li>
                                        <p>Information regarding your location</p>
                                    </li>
                                    <li>
                                        <p>Pictures and other information from your Device's camera and photo library</p>
                                    </li>
                                </ul>
                                <p class="text-muted">We use this information to provide features of Our Service, to improve
                                    and customize Our Service. The information may be uploaded to the Company's servers
                                    and/or a Service Provider's server or it may be simply stored on Your device.</p>

                                <p class="text-muted">You can enable or disable access to this information at any time,
                                    through Your Device settings.</p>

                                <p class="text-muted"><b>Use of Your Personal Data</b></p>

                                <p class="text-muted">The Company may use Personal Data for the following purposes:</p>

                                <ul class="text-muted">
                                    <li>
                                        <p><strong>To provide and maintain our Service</strong>, including to monitor the
                                            usage of our Service.</p>
                                    </li>
                                    <li>
                                        <p><strong>To manage Your Account:</strong> To manage Your registration as a user of
                                            the Service. The Personal Data You provide can give You access to different
                                            functionalities of the Service that are available to You as a registered user.
                                        </p>
                                    </li>
                                    <li>
                                        <p><strong>For the performance of a contract:</strong> The development, compliance
                                            and undertaking of the purchase contract for the products, items or services You
                                            have purchased or of any other contract with Us through the Service.</p>
                                    </li>
                                    <li>
                                        <p><strong>To contact You:</strong> To contact You by email, telephone calls, SMS,
                                            or other equivalent forms of electronic communication, such as a mobile
                                            application's push notifications regarding updates or informative communications
                                            related to the functionalities, products or contracted services, including the
                                            security updates, when necessary or reasonable for their implementation.</p>
                                    </li>
                                    <li>
                                        <p><strong>To provide You:</strong> With news, special offers and general
                                            information
                                            about other goods, services and events which we offer that are similar to those
                                            that you have already purchased or enquired about unless You have opted not to
                                            receive such information.</p>
                                    </li>
                                    <li>
                                        <p><strong>To manage Your requests:</strong> To attend and manage Your requests to
                                            Us.</p>
                                    </li>
                                    <li>
                                        <p><strong>For business transfers:</strong> We may use Your information to evaluate
                                            or conduct a merger, divestiture, restructuring, reorganization, dissolution, or
                                            other sale or transfer of some or all of Our assets, whether as a going concern
                                            or as part of bankruptcy, liquidation, or similar proceeding, in which Personal
                                            Data held by Us about our Service users is among the assets transferred.</p>
                                    </li>
                                    <li>
                                        <p><strong>For other purposes</strong>: We may use Your information for other
                                            purposes, such as data analysis, identifying usage trends, determining the
                                            effectiveness of our promotional campaigns and to evaluate and improve our
                                            Service, products, services, marketing and your experience.</p>
                                    </li>
                                    <li>
                                        <p><strong>For Notification Purposes:</strong>: Our app offers push notifications,
                                            which are messages or alerts sent to your device even when the app is not in
                                            use. We will only send you push notifications if you have opted in to receive
                                            them. You can change your preferences for push notifications at any time in your
                                            device settings.</p>
                                    </li>
                                </ul>

                                <p class="text-muted">We may share Your personal information in the following situations:
                                </p>

                                <ul class="text-muted">
                                    <li>
                                        <p><strong>With Service Providers:</strong> We may share Your personal information
                                            with
                                            Service Providers to monitor and analyze the use of our Service, to contact You.
                                        </p>
                                    </li>
                                    <li>
                                        <p><strong>For business transfers:</strong> We may share or transfer Your personal
                                            information in connection with, or during negotiations of, any merger, sale of
                                            Company assets, financing, or acquisition of all or a portion of Our business to
                                            another company.</p>
                                    </li>
                                    <li>
                                        <p><strong>With Affiliates:</strong> We may share Your information with Our
                                            affiliates,
                                            in which case we will require those affiliates to honor this Privacy Policy.
                                            Affiliates include Our parent company and any other subsidiaries, joint venture
                                            partners or other companies that We control or that are under common control
                                            with
                                            Us.</p>
                                    </li>
                                    <li>
                                        <p><strong>With business partners:</strong> We may share Your information with Our
                                            business partners to offer You certain products, services or promotions.</p>
                                    </li>
                                    <li>
                                        <p><strong>With other users:</strong> when You share personal information or
                                            otherwise
                                            interact in the public areas with other users, such information may be viewed by
                                            all
                                            users and may be publicly distributed outside.</p>
                                    </li>
                                    <li>
                                        <p><strong>With Your consent</strong>: We may disclose Your personal information for
                                            any other purpose with Your consent.</p>
                                    </li>
                                </ul>

                                <p class="text-muted"><b>Retention of Your Personal Data</b></p>
                                </p>
                                <p class="text-muted">The Company will retain Your Personal Data only for as long as is
                                    necessary for the purposes set out in this Privacy Policy. We will retain and use Your
                                    Personal Data to the extent necessary to comply with our legal obligations (for example,
                                    if we are required to retain your data to comply with applicable laws), resolve
                                    disputes, and enforce our legal agreements and policies.</p>

                                <p class="text-muted">The Company will also retain Usage Data for internal analysis
                                    purposes. Usage Data is generally retained for a shorter period of time, except when
                                    this data is used to strengthen the security or to improve the functionality of Our
                                    Service, or We are legally obligated to retain this data for longer time periods.</p>

                                <p class="text-muted"><b>Transfer of Your Personal Data</b></p>

                                <p class="text-muted">Your information, including Personal Data, is processed at the
                                    Company's operating offices and in any other places where the parties involved in the
                                    processing are located. It means that this information may be transferred to — and
                                    maintained on — computers located outside of Your state, province, country or other
                                    governmental jurisdiction where the data protection laws may differ than those from Your
                                    jurisdiction.</p>

                                <p class="text-muted">Your consent to this Privacy Policy followed by Your submission of
                                    such information represents Your agreement to that transfer.</p>

                                <p class="text-muted">The Company will take all steps reasonably necessary to ensure that
                                    Your data is treated securely and in accordance with this Privacy Policy and no transfer
                                    of Your Personal Data will take place to an organization or a country unless there are
                                    adequate controls in place including the security of Your data and other personal
                                    information.</p>

                                <p class="text-muted"><b>Delete Your Personal Data</b></p>

                                <p class="text-muted">You have the right to delete or request that We assist in deleting the
                                    Personal Data that We have collected about You.</p>

                                <p class="text-muted">Our Service may give You the ability to delete certain information
                                    about You from within the Service.</p>

                                <p class="text-muted">You may update, amend, or delete Your information at any time by
                                    signing in to Your Account, if you have one, and visiting the account settings section
                                    that allows you to manage Your personal information. You may also contact Us to request
                                    access to, correct, or delete any personal information that You have provided to Us.</p>

                                <p class="text-muted">Please note, however, that We may need to retain certain information
                                    when we have a legal obligation or lawful basis to do so.</p>

                                <p class="text-muted"><b>Disclosure of Your Personal Data</b></p>

                                <p class="text-muted"><b>Business Transactions</b></p>

                                <p class="text-muted">If the Company is involved in a merger, acquisition or asset sale,
                                    Your Personal Data may be transferred. We will provide notice before Your Personal Data
                                    is transferred and becomes subject to a different Privacy Policy.</p>

                                <p class="text-muted"><b>Law enforcement</b></p>

                                <p class="text-muted">Under certain circumstances, the Company may be required to disclose
                                    Your Personal Data if required to do so by law or in response to valid requests by
                                    public authorities (e.g. a court or a government agency).</p>

                                <p class="text-muted"><b>Other legal requirements</b></p>

                                <p class="text-muted">The Company may disclose Your Personal Data in the good faith belief
                                    that such action is necessary to:</p>

                                <ul class="text-muted">
                                    <li>
                                        <p>Comply with a legal obligation</p>
                                    </li>
                                    <li>
                                        <p>Protect and defend the rights or property of the Company</p>
                                    </li>
                                    <li>
                                        <p>Prevent or investigate possible wrongdoing in connection with the Service</p>
                                    </li>
                                    <li>
                                        <p>Protect the personal safety of Users of the Service or the public</p>
                                    </li>
                                    <li>
                                        <p>Protect against legal liability</p>
                                    </li>
                                </ul>

                                <p class="text-muted"><b>Security of Your Personal Data</b></p>

                                <p class="text-muted">The security of Your Personal Data is important to Us, but remember
                                    that no method of transmission over the Internet, or method of electronic storage is
                                    100% secure. While We strive to use commercially acceptable means to protect Your
                                    Personal Data, We cannot guarantee its absolute security.</p>

                                <h5>Children's Privacy</h5>

                                <p class="text-muted">Our Service does not address anyone under the age of 13. We do not
                                    knowingly collect personally identifiable information from anyone under the age of 13.
                                    If You are a parent or guardian and You are aware that Your child has provided Us with
                                    Personal Data, please contact Us. If We become aware that We have collected Personal
                                    Data from anyone under the age of 13 without verification of parental consent, We take
                                    steps to remove that information from Our servers.</p>

                                <p class="text-muted">If We need to rely on consent as a legal basis for processing Your
                                    information and Your country requires consent from a parent, We may require Your
                                    parent's consent before We collect and use that information.</p>

                                <h5>Push Notification</h5>

                                <p class="text-muted"><b>Push Notifications Consent</b></p>

                                <p class="text-muted">Our app offers push notifications, which are messages or alerts sent to your device even when the app is not in use. We will only send you push notifications if you have opted in to receive them. You can change your preferences for push notifications at any time in your device settings.</p>

                                <p class="text-muted"><b>Use of Data</b></p>

                                <p class="text-muted">We may collect certain information from your device in order to deliver push notifications, such as your device's unique token. We will not share this data with third parties without your consent, except as required by law.</p>

                                <p class="text-muted"><b>Types of Notifications</b></p>

                                <p class="text-muted">We send push notifications to provide updates on [services, features, promotions, etc.]. We will only send marketing-related notifications if you have explicitly consented to receiving such messages. You may opt out of marketing-related push notifications by [provide instructions on how to opt-out].</p>

                                <p class="text-muted"><b>Opt-out Mechanism</b></p>

                                <p class="text-muted">If at any time you wish to stop receiving notifications, you can disable push notifications by adjusting your device's settings or through the settings option in the app.</p>

                                <p class="text-muted"><b>Third-party Data Sharing</b></p>

                                <p class="text-muted">We may use third-party services such as Firebase Cloud Messaging (FCM) or Apple Push Notification Service (APNs) to send notifications. These services may collect and process your device data for the purpose of delivering notifications. By using our app, you agree to these third-party services' data policies.</p>

                                <h5>Links to Other Websites</h5>

                                <p class="text-muted">Our Service may contain links to other websites that are not operated
                                    by Us. If You click on a third party link, You will be directed to that third party's
                                    site. We strongly advise You to review the Privacy Policy of every site You visit.</p>

                                <p class="text-muted">We have no control over and assume no responsibility for the content,
                                    privacy policies or practices of any third party sites or services.</p>

                                <h5>Changes to this Privacy Policy</h5>

                                <p class="text-muted">We may update Our Privacy Policy from time to time. We will notify You
                                    of any changes by posting the new Privacy Policy on this page.</p>

                                <p class="text-muted">We will let You know via email and/or a prominent notice on Our
                                    Service, prior to the change becoming effective and update the "Last updated" date at
                                    the top of this Privacy Policy.</p>

                                <p class="text-muted">You are advised to review this Privacy Policy periodically for any
                                    changes. Changes to this Privacy Policy are effective when they are posted on this page.
                                </p>

                                <h5>Contact Us</h5>

                                <p class="text-muted">If you have any questions about this Privacy Policy, You can contact
                                    us:</p>

                                <ul class="text-muted">
                                    <li>
                                        <p>By email: <a
                                                href="mailto:webmaster@example.com">info@yesyesindiansupermarket.com.au</a>
                                        </p>
                                    </li>
                                    <li>
                                        <p>By visiting this page on our website:
                                            <a
                                                href="https://www.yesyesindiansupermarket.com.au">https://www.yesyesindiansupermarket.com.au</a>
                                        </p>
                                    </li>
                                </ul>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
