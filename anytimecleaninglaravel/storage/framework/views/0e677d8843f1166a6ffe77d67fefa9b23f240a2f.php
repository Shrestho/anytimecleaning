<?php if($customFields): ?>
    <h5 class="col-12 pb-4"><?php echo trans('lang.main_fields'); ?></h5>
<?php endif; ?>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Name Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('name', trans("lang.wallet_name"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.wallet_name_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.wallet_name_help")); ?>

            </div>
        </div>
    </div>

    <!-- Currency Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('currency', trans("lang.wallet_currency"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('currency', $currency, null, ['class' => 'select2 form-control']); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.wallet_currency_help")); ?></div>
        </div>
    </div>

</div>
<div class="d-flex flex-column col-sm-12 col-md-6">

    <!-- User Id Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('user_id', trans("lang.wallet_user_id"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('user_id', $user, null, ['class' => 'select2 form-control']); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.wallet_user_id_help")); ?></div>
        </div>
    </div>

    <!-- 'Boolean Enabled Field' -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('enabled', trans("lang.wallet_enabled"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?> <?php echo Form::hidden('enabled', 0, ['id'=>"hidden_enabled"]); ?>

        <div class="col-md-9 icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('enabled', 1, null); ?> <label for="enabled"></label>
        </div>
    </div>

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
        <i class="fas fa-save"></i> <?php echo e(trans('lang.save')); ?> <?php echo e(trans('lang.wallet')); ?></button>
    <a href="<?php echo route('wallets.index'); ?>" class="btn btn-default"><i class="fas fa-undo"></i> <?php echo e(trans('lang.cancel')); ?></a>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/wallets/fields.blade.php ENDPATH**/ ?>