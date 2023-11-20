<?php if($customFields): ?>
    <h5 class="col-12 pb-4"><?php echo trans('lang.main_fields'); ?></h5>
<?php endif; ?>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Logo Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('logo', trans("lang.payment_method_logo"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <div style="width: 100%" class="dropzone logo" id="logo" data-field="logo">
                <input type="hidden" name="logo">
            </div>
            <a href="#loadMediaModal" data-dropzone="logo" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-<?php echo e(setting('theme_color','primary')); ?> btn-sm float-right mt-1"><?php echo e(trans('lang.media_select')); ?></a>
            <div class="form-text text-muted w-50">
                <?php echo e(trans("lang.payment_method_logo_help")); ?>

            </div>
        </div>
    </div>
    <?php $__env->startPrepend('scripts'); ?>
        <script type="text/javascript">
            var var1610036818671499439ble = '';
            <?php if(isset($payment_method) && $payment_method->hasMedia('logo')): ?>
                var1610036818671499439ble = {
                name: "<?php echo $payment_method->getFirstMedia('logo')->name; ?>",
                size: "<?php echo $payment_method->getFirstMedia('logo')->size; ?>",
                type: "<?php echo $payment_method->getFirstMedia('logo')->mime_type; ?>",
                collection_name: "<?php echo $payment_method->getFirstMedia('logo')->collection_name; ?>"
            };
            <?php endif; ?>
            var dz_var1610036818671499439ble = $(".dropzone.logo").dropzone({
                url: "<?php echo url('uploads/store'); ?>",
                addRemoveLinks: true,
                maxFiles: 1,
                init: function () {
                    <?php if(isset($payment_method) && $payment_method->hasMedia('logo')): ?>
                    dzInit(this, var1610036818671499439ble, '<?php echo url($payment_method->getFirstMediaUrl('logo','thumb')); ?>')
                    <?php endif; ?>
                },
                accept: function (file, done) {
                    dzAccept(file, done, this.element, "<?php echo config('medialibrary.icons_folder'); ?>");
                },
                sending: function (file, xhr, formData) {
                    dzSending(this, file, formData, '<?php echo csrf_token(); ?>');
                },
                maxfilesexceeded: function (file) {
                    dz_var1610036818671499439ble[0].mockFile = '';
                    dzMaxfile(this, file);
                },
                complete: function (file) {
                    dzComplete(this, file, var1610036818671499439ble, dz_var1610036818671499439ble[0].mockFile);
                    dz_var1610036818671499439ble[0].mockFile = file;
                },
                removedfile: function (file) {
                    dzRemoveFile(
                        file, var1610036818671499439ble, '<?php echo url("payment_methods/remove-media"); ?>',
                        'logo', '<?php echo isset($payment_method) ? $payment_method->id : 0; ?>', '<?php echo url("uplaods/clear"); ?>', '<?php echo csrf_token(); ?>'
                    );
                }
            });
            dz_var1610036818671499439ble[0].mockFile = var1610036818671499439ble;
            dropzoneFields['logo'] = dz_var1610036818671499439ble;
        </script>
<?php $__env->stopPrepend(); ?>

<!-- Name Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('name', trans("lang.payment_method_name"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.payment_method_name_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.payment_method_name_help")); ?>

            </div>
        </div>
    </div>

    <!-- Description Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('description', trans("lang.payment_method_description"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('description', null,  ['class' => 'form-control','placeholder'=>  trans("lang.payment_method_description_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.payment_method_description_help")); ?>

            </div>
        </div>
    </div>

    <!-- Route Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('route', trans("lang.payment_method_route"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('route', null,  ['class' => 'form-control','placeholder'=>  trans("lang.payment_method_route_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.payment_method_route_help")); ?>

            </div>
        </div>
    </div>
</div>
<div class="d-flex flex-column col-sm-12 col-md-6">

    <!-- Order Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('order', trans("lang.payment_method_order"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::number('order', null,  ['class' => 'form-control','min'=> '0', 'placeholder' =>  trans("lang.payment_method_order_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.payment_method_order_help")); ?>

            </div>
        </div>
    </div>

    <!-- Boolean Default Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('default', trans("lang.payment_method_default"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <?php echo Form::hidden('default', 0, ['id'=>"hidden_default"]); ?>

        <div class="col-9 icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('default', 1, null); ?>

            <label for="default"></label>
        </div>
    </div>

</div>
<div class="clearfix"></div>
<div class="col-12 custom-field-container">
    <?php if(isset($paymentMethod)): ?>
        <?php if($paymentMethod['route'] == "/Cash"): ?>
            <?php echo $__env->make('payment_methods.cash', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/PayPal"): ?>
            <?php echo $__env->make('payment_methods.paypal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/RazorPay"): ?>
            <?php echo $__env->make('payment_methods.razorpay', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/Stripe"): ?>
            <?php echo $__env->make('payment_methods.stripe', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/StripeFPX"): ?>
            <?php echo $__env->make('payment_methods.stripe_fpx', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/PayStack"): ?>
            <?php echo $__env->make('payment_methods.paystack', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/FlutterWave"): ?>
            <?php echo $__env->make('payment_methods.flutterwave', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/Wallet"): ?>
            <?php echo $__env->make('payment_methods.wallet', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($paymentMethod['route'] == "/PayMongo"): ?>
            <?php echo $__env->make('payment_methods.paymongo', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>
    <?php endif; ?>
</div>
<?php if($customFields): ?>
    <div class="clearfix"></div>
    <div class="col-12 custom-field-container">
        <h5 class="col-12 pb-4"><?php echo trans('lang.custom_field_plural'); ?></h5>
        <?php echo $customFields; ?>

    </div>
<?php endif; ?>
<!-- Submit Field -->
<div class="form-group col-12 d-flex flex-column flex-md-row justify-content-md-end justify-content-sm-center border-top pt-4">
    <button type="submit" class="btn bg-<?php echo e(setting('theme_color')); ?> mx-md-3 my-lg-0 my-xl-0 my-md-0 my-2">
        <i class="fas fa-save"></i> <?php echo e(trans('lang.save')); ?> <?php echo e(trans('lang.payment_method')); ?></button>
    <a href="<?php echo route('paymentMethods.index'); ?>" class="btn btn-default"><i class="fas fa-undo"></i> <?php echo e(trans('lang.cancel')); ?></a>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/payment_methods/fields.blade.php ENDPATH**/ ?>