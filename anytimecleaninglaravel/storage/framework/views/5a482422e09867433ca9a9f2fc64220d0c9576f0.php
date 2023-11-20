

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
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('experiences.edit')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('experiences.edit', $experience->id); ?>"><i class="fas fa-edit mr-2"></i><?php echo e(trans('lang.experience_edit')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                    <li class="nav-item">
                        <a class="nav-link active" href="<?php echo route('experiences.show', $experience->id); ?>"><i class="fas fa-eye mr-2"></i><?php echo e(trans('lang.experience_show')); ?>

                        </a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <div class="row">
                    <?php echo $__env->make('experiences.show_fields', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="card-footer text-right">
                <a href="<?php echo route('experiences.index'); ?>" class="btn btn-default"><i class="fa fa-undo"></i> <?php echo e(trans('lang.back')); ?></a>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/experiences/show.blade.php ENDPATH**/ ?>