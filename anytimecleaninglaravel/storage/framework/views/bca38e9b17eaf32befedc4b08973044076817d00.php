
<?php $__env->startPush('css_lib'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('vendor/icheck-bootstrap/icheck-bootstrap.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/select2/css/select2.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/select2-bootstrap4-theme/select2-bootstrap4.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/summernote/summernote-bs4.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('vendor/dropzone/min/dropzone.min.css')); ?>">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold"><?php echo e(trans('lang.experience_plural')); ?> <small class="mx-3">|</small> <small><?php echo e(trans('lang.experience_desc')); ?></small>
                    </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="<?php echo e(url('/dashboard')); ?>"><i class="fas fa-tachometer-alt"></i> <?php echo e(trans('lang.dashboard')); ?></a></li>
                        <li class="breadcrumb-item"><a href="<?php echo route('experiences.index'); ?>"><?php echo e(trans('lang.experience_plural')); ?></a>
                        </li>
                        <li class="breadcrumb-item active"><?php echo e(trans('lang.experience_edit')); ?></li>
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
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('experiences.index')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('experiences.index'); ?>"><i class="fas fa-list mr-2"></i><?php echo e(trans('lang.experience_table')); ?></a>
                        </li>
                    <?php endif; ?>
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('experiences.create')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('experiences.create'); ?>"><i class="fas fa-plus mr-2"></i><?php echo e(trans('lang.experience_create')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                    <li class="nav-item">
                        <a class="nav-link active" href="<?php echo url()->current(); ?>"><i class="fas fa-edit mr-2"></i><?php echo e(trans('lang.experience_edit')); ?></a>
                    </li>
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('experiences.show')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('experiences.show',$experience->id); ?>"><i class="fas fa-eye mr-2"></i><?php echo e(trans('lang.experience_show')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                </ul>
            </div>
            <div class="card-body">
                <?php echo Form::model($experience, ['route' => ['experiences.update', $experience->id], 'method' => 'patch']); ?>

                <div class="row">
                    <?php echo $__env->make('experiences.fields', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
                <?php echo Form::close(); ?>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <?php echo $__env->make('layouts.media_modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts_lib'); ?>
    <script src="<?php echo e(asset('vendor/select2/js/select2.full.min.js')); ?>"></script>
    <script src="<?php echo e(asset('vendor/summernote/summernote.min.js')); ?>"></script>
    <script src="<?php echo e(asset('vendor/dropzone/min/dropzone.min.js')); ?>"></script>
    <script type="text/javascript">
        Dropzone.autoDiscover = false;
        var dropzoneFields = [];
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/experiences/edit.blade.php ENDPATH**/ ?>