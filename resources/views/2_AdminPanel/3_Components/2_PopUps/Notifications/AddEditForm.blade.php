@php
    $Edit = isset($Notification) ? 1 : 0;
    if ($Edit):
        $Id = $Notification->Id;
        $Title = $Notification->Title;
        $Description = $Notification->Description;
        $ButtonText = $Notification->ButtonText;
        $ButtonLink = $Notification->ButtonLink;
        $NotifyFrom = $Notification->NotifyFrom;
        $NotifyTo = $Notification->NotifyTo;
        $NewTab = $Notification->NewTab;
    endif;
@endphp

<form id="CommonForm" class="row g-3" method="POST" action="{{ Route('UpdateNotification') }}" enctype="multipart/form-data">
    @csrf

    <div class="col-lg-12">
        <label for="NotifyTitle" class="form-label">Title</label>
        <input type="text" class="form-control" id="NotifyTitle" name="Title" placeholder="Enter Title" value="{{ $Title ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="NotifyDescription" class="form-label">Description</label>
        <textarea class="form-control" id="NotifyDescription" name="Description" placeholder="Enter Description">{{ $Description ?? "" }}</textarea>
    </div>

    <div class="col-lg-12">
        <label for="NotifyButtonText" class="form-label">Button Text</label>
        <input type="text" class="form-control contact-info" id="NotifyButtonText" name="ButtonText" placeholder="Button Text" value="{{ $ButtonText ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="NotifyButtonLink" class="form-label">Button Link</label>
        <input type="tel" class="form-control contact-info" id="NotifyButtonLink" name="ButtonLink" placeholder="Button Link" value="{{ $ButtonLink ?? "" }}">
    </div>

    <div class="col-lg-12">
        <div class="form-check form-switch form-switch-lg" dir="ltr">
            <input type="checkbox" class="form-check-input" id="NewTabToggle" name="NewTab" {{ ($NewTab ?? true) ? "checked" : NULL }}>
            <label class="form-check-label" for="NewTabToggle">Open in new tab</label>
        </div>
    </div>

    <div class="col-lg-12">
        <label for="NotifyNotifyFrom" class="form-label">Show From</label>
        <input type="date" class="form-control" id="NotifyFromDate" name="NotifyFrom" placeholder="Show From" value="{{ $NotifyFrom ?? "" }}">
    </div>

    <div class="col-lg-12">
        <label for="NotifyNotifyTo" class="form-label">Show Till</label>
        <input type="date" class="form-control" id="NotifyToDate" name="NotifyTo" placeholder="Show Till" value="{{ $NotifyTo ?? "" }}">
    </div>

    <div class="col-lg-12">
        <div class="hidden">
            <input class="form-control" type="hidden" name="Id" value="{{ $Id ?? "" }}">
        </div>
        <div class="hstack gap-2 justify-content-end">
            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>

</form>