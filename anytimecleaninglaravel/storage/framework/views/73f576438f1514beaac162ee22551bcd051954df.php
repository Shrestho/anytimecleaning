<h5 class="col-12 pb-4"><?php echo trans('lang.app_setting_cash_credentials'); ?></h5>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Boolean Enabled Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('enable_cash', trans("lang.app_setting_enable_cash"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <?php echo Form::hidden('enable_cash', 0, ['id'=>"hidden_enable_cash"]); ?>

        <div class="col-9 icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('enable_cash', 1, setting('enable_cash')); ?>

            <label for="enable_cash"></label>
        </div>
    </div>
</div>
<div class="d-flex flex-column col-sm-12 col-md-6">

</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/payment_methods/cash.blade.php ENDPATH**/ ?>