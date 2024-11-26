<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Static Template</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
</head>

<body
    style="
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: #ffffff;
      font-size: 14px;
    ">

    <div
        style="
        max-width: 680px;
        margin: 0 auto;
        padding: 45px 30px 60px;
        background: #f4f7ff;
        /* background-image: url(https://www.yesyesindiansupermarket.com.au/wp-content/uploads/2021/05/wood.jpg); */
        background-repeat: no-repeat;
        background-size: 800px 452px;
        background-position: top center;
        font-size: 14px;
        color: #434343;
      ">
        <header>
            <table style="width: 100%;">
                <tbody>
                    <tr style="height: 0;">
                        <td>
                            <img alt=""
                                src="https://yesyesloyalty.agatebc.in/2_AdminPanel/images//yes_loyality_log.png"
                                height="30px" />
                        </td>
                        <td style="text-align: right;">
                            <span
                                style="font-size: 16px; line-height: 30px; color: #1f1f1f;">{{ $currentDate->format('F j, Y') }}</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </header>

        <main>
            <div
                style="margin:0;margin-top:20px;padding:40px 30px 0px;background:#ffffff;border-radius:30px;text-align:center">
                <div style="width: 100%; max-width: 489px; margin: 0 auto;">
                    <h1
                        style="
                margin: 0;
                font-size: 24px;
                font-weight: 500;
                color: #1f1f1f;
              ">
                        Your OTP
                    </h1>
                    <p
                        style="
                margin: 0;
                margin-top: 17px;
                font-size: 16px;
                font-weight: 500;
              ">
                        Hey {{ $user->name }},
                    </p>
                    <p
                        style="
                margin: 0;
                margin-top: 17px;
                font-weight: 500;
                letter-spacing: 0.56px;
              ">
                        Thank you for connecting with us. Use the following OTP
                        to complete the procedure to change your password. OTP is
                        valid for
                        <span style="font-weight: 600; color: #1f1f1f;">10 minutes</span>.
                        Do not share this code with others, including Yes Yes Loyalty
                        employees.
                    </p>
                    <p
                        style="
                margin: 0;
                margin-top: 30px;
                font-size: 40px;
                font-weight: 600;
                letter-spacing: 25px;
                color: #cf2e2e;
              ">
                        {{ $otp }}
                    </p>
                </div>
            </div>

            <p
                style="
            max-width: 400px;
            margin: 0 auto;
            margin-top: 20px;
            text-align: center;
            font-weight: 500;
            color: #8c8c8c;
          ">
                Need help? Ask at
                <a href="mailto:info@yesyesindiansupermarket.com.au"
                    style="color: #499fb6; text-decoration: none;">info@yesyesindiansupermarket.com.au</a>
                or visit our
                <a href="" target="_blank" style="color: #499fb6; text-decoration: none;">Nearest Store</a>
            </p>
        </main>

        <footer
            style="
          width: 100%;
          max-width: 490px;
          margin: 20px auto 0;
          text-align: center;
          border-top: 1px solid #e6ebf1;
        ">
            <p
                style="
            margin: 0;
            margin-top: 20px;
            font-size: 16px;
            font-weight: 600;
            color: #434343;
          ">
                Yes Yes Indian Supermarket
            </p>
            <p style="margin: 0; margin-top: 8px; color: #434343;">
                Shop 2A/540, Tarneit Central Shopping Centre, Derrimut Road, Tarneit, Australia.
            </p>
            <div style="margin: 0; margin-top: 16px;">
                <a href="https://www.facebook.com/pg/Yes-Yes-Indian-Supermarket-Tarneit-Central-858462634314449/posts/"
                    target="_blank" style="display: inline-block;">
                    <img width="36px" alt="Facebook"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661502815169_682499/email-template-icon-facebook" />
                </a>
                <a href="https://www.instagram.com/yesyesindiansupermarket/" target="_blank"
                    style="display: inline-block; margin-left: 8px;">
                    <img width="36px" alt="Instagram"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661504218208_684135/email-template-icon-instagram" /></a>
                {{-- <a href="" target="_blank" style="display: inline-block; margin-left: 8px;">
                    <img width="36px" alt="Twitter"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503043040_372004/email-template-icon-twitter" />
                </a>
                <a href="" target="_blank" style="display: inline-block; margin-left: 8px;">
                    <img width="36px" alt="Youtube"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503195931_210869/email-template-icon-youtube" /></a> --}}
            </div>
            <p style="margin: 0; margin-top: 16px; color: #434343;">
                Copyright © 2024 Yes Yes Indian Supermarket. All rights reserved.
            </p>
        </footer>
    </div>
</body>

</html>