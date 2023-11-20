
<?php $__env->startPush('css_lib'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('vendor/icheck-bootstrap/icheck-bootstrap.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/select2/css/select2.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/select2-bootstrap4-theme/select2-bootstrap4.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/summernote/summernote-bs4.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/dropzone/min/dropzone.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')); ?>">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold"><?php echo e(trans('lang.e_service_plural')); ?> <small class="mx-3">|</small><small><?php echo e(trans('lang.e_service_desc')); ?></small>
                    </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="<?php echo e(url('/dashboard')); ?>"><i class="fas fa-tachometer-alt"></i> <?php echo e(trans('lang.dashboard')); ?></a></li>
                        <li class="breadcrumb-item">
                            <a href="<?php echo route('eServices.index'); ?>"><?php echo e(trans('lang.e_service_plural')); ?></a>
                        </li>
                        <li class="breadcrumb-item active"><?php echo e(trans('lang.e_service_create')); ?></li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="content">
        <div class="clearfix"></div>
        <div class="clearfix"></div>
        <div class="card shadow-sm">
            <div class="card-header">
                <ul class="nav nav-tabs d-flex flex-row align-items-start card-header-tabs">
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('eServices.index')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('eServices.index'); ?>"><i class="fa fa-list mr-2"></i><?php echo e(trans('lang.e_service_table')); ?></a>
                        </li>
                    <?php endif; ?>
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('show.in_provider')): ?>
                        <li class="nav-item">
                            <a class="nav-link active" href="<?php echo route('eServices.my_services_table'); ?>"><i class="fa fa-list mr-2"></i>My Services</a>
                        </li>
                    <?php endif; ?>
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('eServices.provider_create')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('eServices.provider_create'); ?>"><i class="fa fa-plus mr-2"></i><?php echo e(trans('lang.e_service_create')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                </ul>
            </div>
            <div class="card-body">
                <?php $__currentLoopData = $provider_services; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $service): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="clearfix btn btn-info">
                    <?php echo e($service->name); ?>

                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
    <?php echo $__env->make('layouts.media_modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts_lib'); ?>
    <script src="<?php echo e(asset('vendor/select2/js/select2.full.min.js')); ?>"></script>
    <script src="<?php echo e(asset('vendor/summernote/summernote.min.js')); ?>"></script>
    <script src="<?php echo e(asset('vendor/dropzone/min/dropzone.min.js')); ?>"></script>
    <script src="<?php echo e(asset('vendor/moment/moment.min.js')); ?>"></script>
    <script src="<?php echo e(asset('vendor/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js')); ?>"></script>
    <script type="text/javascript">
        Dropzone.autoDiscover = false;
        var dropzoneFields = [];
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/e_services/my_services_table.blade.php ENDPATH**/ ?>