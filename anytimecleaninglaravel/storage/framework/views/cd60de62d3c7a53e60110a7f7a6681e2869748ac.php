<h5 class="col-12 pb-4"><?php echo trans('lang.app_setting_stripe_credentials'); ?></h5>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Route Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('stripe_key', trans("lang.app_setting_stripe_key"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('stripe_key', setting('stripe_key'),  ['class' => 'form-control','placeholder'=>  trans("lang.app_setting_stripe_key_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.app_setting_stripe_key_help")); ?>

            </div>
        </div>
    </div>
    <!-- Route Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('stripe_secret', trans("lang.app_setting_stripe_secret"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('stripe_secret', setting('stripe_secret'),  ['class' => 'form-control','placeholder'=>  trans("lang.app_setting_stripe_secret_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.app_setting_stripe_secret_help")); ?>

            </div>
        </div>
    </div>
</div>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Boolean Enabled Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('enable_stripe', trans("lang.app_setting_enable_stripe"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <?php echo Form::hidden('enable_stripe', 0, ['id'=>"hidden_enable_stripe"]); ?>

        <div class="col-9 icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('enable_stripe', 1, setting('enable_stripe')); ?>

            <label for="enable_stripe"></label>
        </div>
    </div>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/payment_methods/stripe.blade.php ENDPATH**/ ?>