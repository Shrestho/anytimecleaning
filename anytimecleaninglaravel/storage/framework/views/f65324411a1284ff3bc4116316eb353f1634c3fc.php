
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
<?php $__env->startSection('settings_title',trans('lang.user_table')); ?>
<?php $__env->startSection('settings_content'); ?>
    <?php echo $__env->make('flash::message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->make('adminlte-templates::common.errors', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <div class="clearfix"></div>
    <div class="card shadow-sm">
        <div class="card-header">
            <ul class="nav nav-tabs d-flex flex-row align-items-start card-header-tabs">
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo route('users.index'); ?>"><i class="fas fa-list mr-2"></i><?php echo e(trans('lang.user_table')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo route('users.create'); ?>"><i class="fas fa-plus mr-2"></i><?php echo e(trans('lang.user_create')); ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<?php echo url()->current(); ?>"><i class="fas fa-pencil mr-2"></i><?php echo e(trans('lang.user_edit')); ?></a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <?php echo Form::model($user, ['route' => ['users.update', $user->id], 'method' => 'patch']); ?>

            <div class="row">
                <?php echo $__env->make('settings.users.fields', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <?php echo Form::close(); ?>

            <div class="clearfix"></div>
        </div>
    </div>
    </div>
    <?php echo $__env->make('layouts.media_modal',['collection'=>null], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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

<?php echo $__env->make('layouts.settings.default', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/settings/users/edit.blade.php ENDPATH**/ ?>