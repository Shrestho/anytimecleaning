
<?php $__env->startPush('css_lib'); ?>
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold"><?php echo e(trans('lang.faq_category_plural')); ?>

                        <small class="mx-3">|</small><small><?php echo e(trans('lang.faq_category_desc')); ?></small>
                    </h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="<?php echo e(url('/dashboard')); ?>"><i class="fas fa-tachometer-alt"></i> <?php echo e(trans('lang.dashboard')); ?></a></li>
                        <li class="breadcrumb-item"><a href="<?php echo route('faqCategories.index'); ?>"><?php echo e(trans('lang.faq_category_plural')); ?></a>
                        </li>
                        <li class="breadcrumb-item active"><?php echo e(trans('lang.faq_category_create')); ?></li>
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
                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('faqCategories.index')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('faqCategories.index'); ?>"><i class="fas fa-list mr-2"></i><?php echo e(trans('lang.faq_category_table')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                    <li class="nav-item">
                        <a class="nav-link active" href="<?php echo url()->current(); ?>"><i class="fas fa-plus mr-2"></i><?php echo e(trans('lang.faq_category_create')); ?></a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <?php echo Form::open(['route' => 'faqCategories.store']); ?>

                <div class="row">
                    <?php echo $__env->make('faq_categories.fields', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
                <?php echo Form::close(); ?>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts_lib'); ?>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/faq_categories/create.blade.php ENDPATH**/ ?>