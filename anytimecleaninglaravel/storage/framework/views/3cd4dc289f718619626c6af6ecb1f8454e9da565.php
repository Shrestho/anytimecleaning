
<?php $__env->startPush('css_lib'); ?>
    <!-- iCheck -->
    <link rel="stylesheet" href="<?php echo e(asset('vendor/icheck-bootstrap/icheck-bootstrap.min.css')); ?>">
    <!-- select2 -->
    <link rel="stylesheet" href="<?php echo e(asset('vendor/select2/css/select2.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/select2-bootstrap4-theme/select2-bootstrap4.min.css')); ?>">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="<?php echo e(asset('vendor/summernote/summernote-bs4.min.css')); ?>">
    
    <link rel="stylesheet" href="<?php echo e(asset('vendor/dropzone/min/dropzone.min.css')); ?>">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold"><?php echo e(trans('lang.payment_method_plural')); ?>

                        <small class="mx-3">|</small><small><?php echo e(trans('lang.payment_method_desc')); ?></small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="<?php echo e(url('/dashboard')); ?>"><i class="fas fa-tachometer-alt"></i> <?php echo e(trans('lang.dashboard')); ?></a></li>
                        <li class="breadcrumb-item"><a href="<?php echo route('paymentMethods.index'); ?>"><?php echo e(trans('lang.payment_method_plural')); ?></a>
                        </li>
                        <li class="breadcrumb-item active"><?php echo e(trans('lang.payment_method_edit')); ?></li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="content">
        <div class="clearfix"></div>
        <?php echo $__env->make('flash::message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php echo $__env->make('adminlte-templates::common.errors', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <div class="clearfix"></div>
        <div class="card shadow-sm">
            <div class="card-header">
                <ul class="nav nav-tabs d-flex flex-row align-items-start card-header-tabs">
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('paymentMethods.index')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('paymentMethods.index'); ?>"><i class="fas fa-list mr-2"></i><?php echo e(trans('lang.payment_method_table')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('paymentMethods.create')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('paymentMethods.create'); ?>"><i class="fas fa-plus mr-2"></i><?php echo e(trans('lang.payment_method_create')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                    <li class="nav-item">
                        <a class="nav-link active" href="<?php echo url()->current(); ?>"><i class="fas fa-pencil mr-2"></i><?php echo e(trans('lang.payment_method_edit')); ?></a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <?php echo Form::model($paymentMethod, ['route' => ['paymentMethods.update', $paymentMethod->id], 'method' => 'patch']); ?>

                <div class="row">
                    <?php echo $__env->make('payment_methods.fields', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
                <?php echo Form::close(); ?>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <?php echo $__env->make('layouts.media_modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts_lib'); ?>
    <!-- iCheck -->

    <!-- select2 -->
    <script src="<?php echo e(asset('vendor/select2/js/select2.full.min.js')); ?>"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="<?php echo e(asset('vendor/summernote/summernote.min.js')); ?>"></script>
    
    <script src="<?php echo e(asset('vendor/dropzone/min/dropzone.min.js')); ?>"></script>
    <script type="text/javascript">
        Dropzone.autoDiscover = false;
        var dropzoneFields = [];
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/payment_methods/edit.blade.php ENDPATH**/ ?>