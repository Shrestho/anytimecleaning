@extends('layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold">{{trans('lang.award_plural') }}<small class="mx-3">|</small>
                    @can('hide.in_provider')
                        <small>{{trans('lang.award_desc')}}</small>
                    @endcan
                    @can('show.in_provider')
                    <small>Award</small>
                    @endcan

                </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="{{url('/dashboard')}}"><i class="fas fa-tachometer-alt"></i> {{trans('lang.dashboard')}}</a></li>
                        <li class="breadcrumb-item"><a href="{!! route('awards.index') !!}">{{trans('lang.award_plural')}}</a>
                        </li>
                        <li class="breadcrumb-item active">{{trans('lang.award_table')}}</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <div class="content">
        <div class="clearfix"></div>
        @include('flash::message')
        <div class="card shadow-sm">
            <div class="card-header">
                <ul class="nav nav-tabs d-flex flex-md-row flex-column-reverse align-items-start card-header-tabs">
                    <div class="d-flex flex-row">
                        <li class="nav-item">
                            <a class="nav-link active" href="{!! url()->current() !!}"><i class="fa fa-list mr-2"></i>{{trans('lang.award_table')}}</a>
                    </li>
                    @can('awards.create')
                        <li class="nav-item">
                            <a class="nav-link" href="{!! route('awards.create') !!}"><i class="fa fa-plus mr-2"></i>{{trans('lang.award_create')}}</a>
                        </li>
                    @endcan
                    </div>
                    @can('hide.in_provider')
                        @include('layouts.right_toolbar', compact('dataTable'))
                    @endcan
                    @can('show.in_provider')
                        @include('layouts.provider_right_toolbar', compact('dataTable'))
                    @endcan
                </ul>
            </div>
            <div class="card-body">
                @include('awards.table')
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
@endsection
