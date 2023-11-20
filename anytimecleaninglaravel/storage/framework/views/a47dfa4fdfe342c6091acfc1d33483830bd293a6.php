
<?php $__env->startPush('css_lib'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('vendor/bs-stepper/css/bs-stepper.min.css')); ?>">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-6">
                    <h1 class="m-0 text-bold"><?php echo e(trans('lang.booking_plural')); ?> <small class="mx-3">|</small><small><?php echo e(trans('lang.booking_desc')); ?></small></h1>
                </div><!-- /.col -->
                <div class="col-md-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="<?php echo e(url('/')); ?>"><i class="fas fa-tachometer-alt"></i> <?php echo e(trans('lang.dashboard')); ?></a></li>
                        <li class="breadcrumb-item active"><a href="<?php echo route('bookings.index'); ?>"><?php echo e(trans('lang.booking_plural')); ?></a>
                        </li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="content d-flex flex-column flex-md-row">
        <div class="col-12 col-md-8 col-xl-9">
            <div class="card shadow-sm">
                <div class="card-header">
                    <ul class="nav nav-tabs align-items-end card-header-tabs w-100">
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo route('bookings.index'); ?>"><i class="fa fa-list mr-2"></i><?php echo e(trans('lang.booking_table')); ?></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<?php echo route('bookings.show',$booking->id); ?>"><i class="fas fa-calendar-check mr-2"></i><?php echo e(trans('lang.booking_details')); ?>

                            </a>
                        </li>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('bookings.edit')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo route('bookings.edit',$booking->id); ?>"><i class="fas fa-edit mr-2"></i><?php echo e(trans('lang.booking_edit')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
                <div class="card-body p-0">

                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center bg-light">
                            <b><?php echo e(__('lang.booking_status')); ?></b>
                            <?php if($booking->cancel): ?>
                                <span class="badge bg-danger px-2 py-2"><?php echo e(__('lang.booking_cancel')); ?></span>
                            <?php endif; ?>
                        </li>
                        <li class="bs-stepper list-group-item">
                            <div class="bs-stepper-header" role="tablist">
                                <?php $__currentLoopData = $bookingStatuses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bookingStatus): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="step">
                                        <span role="tab">
                                            <span class="bs-stepper-circle <?php if($bookingStatus->id == $booking->booking_status_id): ?> bg-<?php echo e(setting('theme_color')); ?> <?php endif; ?>"><?php echo e($bookingStatus->order); ?></span>
                                            <span class="bs-stepper-label"><?php echo e($bookingStatus->status); ?></span> </span>
                                    </div>
                                    <?php if(!$loop->last): ?>
                                        <div class="line"></div>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <b><?php echo e(__('lang.booking_id')); ?> #<?php echo e($booking->id); ?></b>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <?php echo getMediaColumn($booking->e_service,'image','rounded shadow-sm border'); ?>

                            <div class="d-flex flex-column mx-3">
                                <small><?php echo e(__('lang.booking_e_service')); ?></small>
                                <span><b><?php echo e($booking->e_service->name); ?></b></span>
                            </div>
                            <div class="d-flex ml-xl-auto flex-column mx-3">
                                <?php if($booking->e_service->price_unit == 'fixed' && !empty($booking->e_service->quantity_unit)): ?>
                                    <small><?php echo e(__('lang.e_service_quantity')); ?></small>
                                    <span><b><?php echo e($booking->quantity); ?> </b><small><?php echo e($booking->e_service->quantity_unit); ?></small></span>
                                <?php else: ?>
                                    <small><?php echo e(__('lang.e_service_duration')); ?></small>
                                    <span><b><?php echo e($booking->getDurationInHours()); ?> </b><small><?php echo e(__('lang.booking_hours')); ?></small></span>
                                <?php endif; ?>
                            </div>
                            <div class="text-bold ml-xl-auto my-1 my-xl-0">
                                <?php if($booking->e_service->hasDiscount()): ?>
                                    <del class="text-gray"><?php echo getPrice($booking->e_service->price); ?></del>
                                <?php endif; ?>
                                <?php if($booking->e_service->price_unit == 'fixed' && !empty($booking->e_service->quantity_unit)): ?>
                                    <span class="h5 text-bold"><?php echo getPrice($booking->e_service->getPrice()); ?> / <?php echo e($booking->e_service->quantity_unit); ?></span>
                                <?php else: ?>
                                    <span class="h5 text-bold"><?php echo getPrice($booking->e_service->getPrice()); ?> / <?php echo e(__('lang.e_service_price_unit_'.$booking->e_service->price_unit)); ?></span>
                                <?php endif; ?>
                            </div>
                        </li>
                        <li class="list-group-item bg-light">
                            <b><?php echo e(__('lang.option_plural')); ?></b>
                        </li>
                        <?php $__currentLoopData = $booking->options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <?php echo getMediaColumn($option,'image','rounded shadow-sm border'); ?>

                                <span class="mx-3"><b><?php echo e($option->name); ?></b><small class="mx-3"> <?php echo e(getStripedHtmlColumn($option,'description')); ?></small></span>
                                <h6 class="text-bold ml-xl-auto my-1 my-xl-0"><?php echo getPriceColumn($option); ?></h6>
                            </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                    <div class="d-flex flex-column flex-md-row">
                        <ul class="list-group list-group-flush col-12 col-lg-7 p-0">
                            <span class="list-group-item py-0"></span>
                            <li class="list-group-item bg-light">
                                <b><?php echo e(__('lang.payment')); ?></b>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <b><?php echo e(__('lang.payment_status')); ?></b>
                                <small class="badge badge-light px-2 py-1"><?php echo e(empty(!$booking->payment) ? $booking->payment->paymentStatus->status : '-'); ?></small>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <b><?php echo e(__('lang.payment_method')); ?></b>
                                <small class="badge badge-light px-2 py-1"><?php echo e(empty(!$booking->payment) ? $booking->payment->paymentMethod->name : '-'); ?></small>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <b><?php echo e(__('lang.booking_hint')); ?></b> <small><?php echo e($booking->hint); ?></small>
                            </li>
                        </ul>
                        <ul class="list-group list-group-flush col-12 col-lg-5 p-0">
                            <span class="list-group-item py-0"></span>
                            <li class="list-group-item bg-light">
                                <b><?php echo e(__('lang.booking_taxes_fees')); ?></b>
                            </li>
                            <?php $__currentLoopData = $booking->taxes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tax): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span><b><?php echo e($tax->name); ?></b></span>
                                    <h6 class="text-bold ml-xl-auto my-1 my-xl-0">
                                        <?php if($tax->type == 'percent'): ?>
                                            <?php echo e($tax->value .'%'); ?>

                                        <?php else: ?>
                                            <?php echo getPriceColumn($tax,'value'); ?>

                                        <?php endif; ?>
                                    </h6>
                                </li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <li class="list-group-item bg-light">
                                <b><?php echo e(__('lang.booking_coupon')); ?></b>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span><b><?php echo e($booking->coupon->code); ?></b><small class="mx-3"> <?php echo e(getStripedHtmlColumn($booking->coupon,'description')); ?></small></span>
                                <h6 class="text-bold ml-xl-auto my-1 my-xl-0">
                                    <?php if($booking->coupon->discount_type == 'percent'): ?>
                                        <?php echo e((-$booking->coupon->discount) .'%'); ?>

                                    <?php else: ?>
                                        <?php echo getPrice(-$booking->coupon->discount); ?>

                                    <?php endif; ?>
                                </h6>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <b><?php echo e(__('lang.booking_subtotal')); ?></b> <h6 class="text-bold"><?php echo getPrice($booking->getSubtotal()); ?></h6>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <b><?php echo e(__('lang.booking_total')); ?></b> <h5 class="text-bold"><?php echo getPrice($booking->getTotal()); ?></h5>
                            </li>
                        </ul>
                    </div>

                    <!-- Back Field -->
                    <div class="form-group col-12 d-flex flex-column flex-md-row justify-content-md-end justify-content-sm-center border-top pt-4">
                        <a href="#" class="btn btn-default mx-md-2 my-md-0 my-2"> <i class="fas fa-print"></i> <?php echo e(trans('lang.print')); ?>

                        </a> <a href="<?php echo route('bookings.edit', $booking->id); ?>" class="btn btn-default mx-md-2">
                            <i class="fas fa-edit"></i> <?php echo e(trans('lang.booking_edit')); ?>

                        </a> <a href="<?php echo route('bookings.index'); ?>" class="btn btn-default mx-md-2">
                            <i class="fas fa-list"></i> <?php echo e(trans('lang.booking_table')); ?>

                        </a>

                    </div>

                </div>
            </div>
        </div>
        <div class="col-12 col-md-4 col-xl-3">
            <div class="card shadow-sm">
                <div class="card-header text-bold">
                    <?php echo e(__('lang.booking_user_id')); ?>

                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex flex-xl-row flex-column justify-content-between align-items-center align-items-xl-start px-0">
                            <?php echo getMediaColumn($booking->user,'avatar','img-circle shadow-sm border'); ?>

                            <div class="d-flex flex-column align-items-center align-items-xl-start mx-2 my-1 my-xl-0 my-0">
                                <b><?php echo e($booking->user->name); ?></b> <small><?php echo e($booking->user->email); ?></small> <small><?php echo e($booking->user->phone_number); ?></small>
                            </div>
                            <a target="_blank" class="btn btn-sm btn-default ml-xl-auto my-1 my-xl-0" href="<?php echo e(route('users.edit',$booking->user->id)); ?>"><i class="fas fa-user-alt mx-1"></i><?php echo e(__('lang.user_profile')); ?>

                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="card shadow-sm">
                <div class="card-header text-bold">
                    <?php echo e(__('lang.booking_time')); ?>

                </div>
                <div class="card-body px-0 py-1">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <b><?php echo e(__('lang.booking_booking_at')); ?></b> <small><?php echo e($booking->booking_at); ?></small>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <b><?php echo e(__('lang.booking_start_at')); ?></b> <small><?php echo e($booking->start_at ?: '-'); ?></small>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <b><?php echo e(__('lang.booking_ends_at')); ?></b> <small><?php echo e($booking->ends_at ?: '-'); ?></small>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="card shadow-sm">
                <div class="card-header text-bold">
                    <?php echo e(__('lang.booking_address')); ?>

                </div>
                <div class="card-body  px-0 py-1">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <small><?php echo e($booking->address->address); ?></small>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <b><?php echo e(__('lang.address_open_with')); ?></b>
                            <a target="_blank" class="btn btn-sm btn-default" href="<?php echo e('https://www.google.com/maps/@'.$booking->address->latitude .','.$booking->address->longitude.',14z'); ?>"><i class="fas fa-directions mx-1"></i><?php echo e(__('lang.address_google_maps')); ?>

                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>

    </div>
    <!-- /.modal -->
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts_lib'); ?>
    
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/bookings/show.blade.php ENDPATH**/ ?>