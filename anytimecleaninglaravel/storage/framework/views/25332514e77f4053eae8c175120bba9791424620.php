<h5 class="col-12 pb-4"><?php echo trans('lang.app_setting_paymongo_credentials'); ?></h5>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Route Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('paymongo_key', trans("lang.app_setting_paymongo_key"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('paymongo_key', setting('paymongo_key'),  ['class' => 'form-control','placeholder'=>  trans("lang.app_setting_paymongo_key_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.app_setting_paymongo_key_help")); ?>

            </div>
        </div>
    </div>
    <!-- Route Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('paymongo_secret', trans("lang.app_setting_paymongo_secret"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('paymongo_secret', setting('paymongo_secret'),  ['class' => 'form-control','placeholder'=>  trans("lang.app_setting_paymongo_secret_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.app_setting_paymongo_secret_help")); ?>

            </div>
        </div>
    </div>
</div>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Boolean Enabled Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('enable_paymongo', trans("lang.app_setting_enable_paymongo"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <?php echo Form::hidden('enable_paymongo', 0, ['id'=>"hidden_enable_paymongo"]); ?>

        <div class="col-9 icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('enable_paymongo', 1, setting('enable_paymongo')); ?>

            <label for="enable_paymongo"></label>
        </div>
    </div>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/payment_methods/paymongo.blade.php ENDPATH**/ ?>