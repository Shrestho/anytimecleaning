
<?php $__env->startPush('css_lib'); ?>
    <!-- iCheck -->
    <link rel="stylesheet" href="<?php echo e(asset('vendor/icheck-bootstrap/icheck-bootstrap.min.css')); ?>">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('settings_title',trans('lang.permission_table')); ?>

<?php $__env->startSection('settings_content'); ?>
    <?php echo $__env->make('flash::message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <div class="card shadow-sm">
        <div class="card-header">
            <ul class="nav nav-tabs d-flex flex-md-row flex-column-reverse align-items-start card-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="<?php echo route('permissions.index'); ?>"><i class="fas fa-list mr-2"></i><?php echo e(trans('lang.permission_table')); ?></a>
                </li>
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('permissions.create')): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo route('permissions.create'); ?>"><i class="fas fa-plus mr-2"></i><?php echo e(trans('lang.permission_create')); ?></a>
                    </li>
                <?php endif; ?>
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('roles.index')): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo route('roles.index'); ?>"><i class="fas fa-list mr-2"></i><?php echo e(trans('lang.role_table')); ?></a>
                    </li>
                <?php endif; ?>
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('roles.create')): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo route('roles.create'); ?>"><i class="fas fa-plus mr-2"></i><?php echo e(trans('lang.role_create')); ?></a>
                    </li>
                <?php endif; ?>

                <?php echo $__env->make('layouts.right_toolbar', compact('dataTable'), \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </ul>
        </div>
        <div class="card-body">
            <?php echo $__env->make('settings.permissions.table', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <div class="clearfix"></div>
        </div>
    </div>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.settings.default', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/settings/permissions/index.blade.php ENDPATH**/ ?>