@extends('2_AdminPanel.1_Layouts.1_MainLayout')

@section('title')
    {{ $PageData['PageTilte'] }}
@endsection

@section('css')
    <link rel="stylesheet" href="{{ URL::asset('2_AdminPanel/libs/gridjs/theme/mermaid.min.css') }}">
@endsection

@section('PageScript')
    {{ $PageData['PageName'] }}
@endsection

@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            {{ $PageData['Crumbs'][0] }}
        @endslot
        @slot('title')
            {{ $PageData['Crumbs'][1] }}
        @endslot
    @endcomponent

    <div class="card">
        <div class="card-body">
            {{-- @if (is_file(public_path('2_AdminPanel/PageConfigs/' . PageName() . '.js')))
                <script src="{{ asset('2_AdminPanel/PageConfigs/' . PageName() . '.js') }}"></script>
            @endif --}}

            
            <div class="row g-4 mb-3">
                @if (isset($Buttons))
                    @foreach ($Buttons as $Button)
                        @php
                            $BtnConfig = '';
                            $BtnClass = 'btn';
                            $BtnId = '';

                            $BtnClass .=
                                isset($Button['colour']) && $Button['colour'] != '' ? ' btn-' . $Button['colour'] : '';

                            $BtnClass .=
                                isset($Button['class']) && $Button['class'] != '' ? ' ' . $Button['class'] : '';

                            $BtnConfig .= $BtnClass != '' ? " class='$BtnClass'" : '';

                            $BtnConfig .= isset($Button['id']) && $Button['id'] != '' ? ' id=' . $Button['id'] : '';

                            $BtnConfig .=
                                isset($Button['link']) && $Button['link'] != '' ? ' href=' . $Button['link'] : '';
                        @endphp
                        <div class="col-sm-auto">
                            @if ($Button['type'] == 'button')
                                <button type="button" {!! $BtnConfig !!}>{!! $Button['text'] !!}</button>
                            @elseif($Button['type'] == 'link')
                                <a {!! $BtnConfig !!}>{!! $Button['text'] !!}</a>
                            @endif
                        </div>
                    @endforeach
                @endif
                @if (isset($select))
                    @if (in_array(Auth::user()->role_id, [3]))
                        <div class="col-sm-auto">
                            <button type="button" class="btn btn-danger add-btn" id="GenrateQr"
                                fdprocessedid="b6dpfi">Generate QR</button>
                        </div>
                    @endif
                    @if (in_array(Auth::user()->role_id, [3, 4]))
                        <div class="col-sm-auto">
                            <button type="button" class="btn btn-danger add-btn" id="Zipfile"
                                fdprocessedid="01mrpa">Download QR Zip</button>
                        </div>
                    @endif
                    {{-- <div class="col-sm-3">
                        <img src="data:image/png;base64, ">
                    </div> --}}

                    {{-- <div class="col-sm-3">
                        <select class="form-select" id="store_name" name="store_name" data-choices>
                            <option value="">
                                filter by branch
                            </option>
                            @foreach ($stores as $store)
                                <option value="{{ $store->id }}">{{ $store->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-select" id="cashier_name" name="cashier_name" data-choices>
                            <option value="">
                                filter by branch
                            </option>
                            @foreach ($users as $user)
                                <option value="{{ $user->id }}">{{ $user->name }}</option>
                            @endforeach
                        </select>
                    </div> --}}
                @endif
                {{-- <div class="col-sm-auto">
                    <button
                        type="button"
                        class="btn btn-success add-btn"
                        id="AddDataModelToggle"
                    >
                        <i class="ri-add-line align-bottom me-1"></i> Add
                    </button>
                </div> --}}
                {{-- <div class="col-sm">
                    <div class="d-flex justify-content-sm-end">
                        <div class="search-box ms-2">
                            <input type="text" class="form-control search" placeholder="Search...">
                            <i class="ri-search-line search-icon"></i>
                        </div>
                    </div>
                </div> --}}
            </div>
            @includeIf("2_AdminPanel.4_SingleUseViews.FormFilters." . PageName())

            {{-- <textarea id="TableColsJson" class="d-none">{!! $TableColsJson !!}</textarea> --}}
            <div id="CommonTable"></div>

            {{-- <table id="datatable" class="table table-bordered dt-responsive nowrap"
                style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                <thead>
                    <tr>
                        @foreach ($TableCols as $ColNames)
                            <th>{{ $ColNames }}</th>
                        @endforeach
                    </tr>
                </thead>

            </table> --}}
        </div>
    </div>
@endsection

@section('script')
    {{-- <script src="{{ asset('/backend/libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('/backend/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script> --}}
    <!-- Buttons examples -->
@endsection
