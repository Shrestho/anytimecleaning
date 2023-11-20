@extends('layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold">Estimate <small class="mx-3">|</small><small>{{trans('lang.e_service_desc')}}</small>
                    </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="{{url('/')}}"><i class="fas fa-tachometer-alt"></i> {{trans('lang.dashboard')}}</a></li>
                        <li class="breadcrumb-item active">
                            <a href="{!! route('contacts.index') !!}">Estimate</a>
                        </li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="content">
        <div class="card shadow-sm">
            <div class="card-header">
                <ul class="nav nav-tabs d-flex flex-row align-items-start card-header-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="{!! route('contacts.index') !!}"><i class="fa fa-list mr-2"></i></a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <div class="row">
                @include('contacts.show_fields')

                <!-- Back Field -->
                    <div class="form-group col-12 d-flex flex-column flex-md-row justify-content-md-end justify-content-sm-center border-top pt-4">
                        <a href="{!! route('contacts.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.back')}}</a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
@endsection
