<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    {{-- <h1>Laravel Time: <b>{{ $timezone }}</b></h1>
    <h1>Laravel Time: <b>{{ $serverTimezone }}</b></h1>
    <h1>Mysql Time: <b>{{ $DBtimezone }}</b></h1> --}}


    <h1>Application - Time: <b>{{ $appCurrentTime }}</b> Zone: <b>{{ $appTimezone }}</b></h1>
    <h1>Server - Time: <b>{{ $serverCurrentTime }}</b> Zone: <b>{{ $serverTimezone }}</b></h1>
    <h1>Database - Zone: <b>{{ $DBtimezone }}</b></h1>
</body>
</html>