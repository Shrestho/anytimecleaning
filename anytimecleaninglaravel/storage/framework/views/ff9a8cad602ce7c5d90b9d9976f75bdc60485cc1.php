

<?php $__env->startSection('content'); ?>

    <!-- Content Header (Page header) -->
    <div class="content-header content-header<?php echo e(setting('fixed_header')); ?>">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold"><?php echo e(trans('lang.setting')); ?><small class="mx-3">|</small><small><?php echo e(trans('lang.setting_desc')); ?></small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="<?php echo e(url('/')); ?>"><i class="fas fa-tachometer-alt"></i> <?php echo e(trans('lang.dashboard')); ?></a></li>
                        <li class="breadcrumb-item active"><?php echo $__env->yieldContent('settings_title'); ?></li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <div class="content">
        <div class="clearfix"></div>
    <?php echo $__env->make('flash::message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-3">
            <?php echo $__env->make('layouts.settings.menu', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        </div>
        <div class="col-md-9">
            <?php echo $__env->yieldContent('settings_content'); ?>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/layouts/settings/default.blade.php ENDPATH**/ ?>