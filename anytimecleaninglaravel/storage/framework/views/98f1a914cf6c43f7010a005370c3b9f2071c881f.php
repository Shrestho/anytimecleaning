<h5 class="col-12 pb-4"><?php echo trans('lang.app_setting_razorpay_credentials'); ?></h5>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Route Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('razorpay_key', trans("lang.app_setting_razorpay_key"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('razorpay_key', setting('razorpay_key'),  ['class' => 'form-control','placeholder'=>  trans("lang.app_setting_razorpay_key_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.app_setting_razorpay_key_help")); ?>

            </div>
        </div>
    </div>
    <!-- Route Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('razorpay_secret', trans("lang.app_setting_razorpay_secret"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('razorpay_secret', setting('razorpay_secret'),  ['class' => 'form-control','placeholder'=>  trans("lang.app_setting_razorpay_secret_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.app_setting_razorpay_secret_help")); ?>

            </div>
        </div>
    </div>
</div>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Boolean Enabled Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('enable_razorpay', trans("lang.app_setting_enable_razorpay"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <?php echo Form::hidden('enable_razorpay', 0, ['id'=>"hidden_enable_razorpay"]); ?>

        <div class="col-9 icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('enable_razorpay', 1, setting('enable_razorpay')); ?>

            <label for="enable_razorpay"></label>
        </div>
    </div>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/payment_methods/razorpay.blade.php ENDPATH**/ ?>