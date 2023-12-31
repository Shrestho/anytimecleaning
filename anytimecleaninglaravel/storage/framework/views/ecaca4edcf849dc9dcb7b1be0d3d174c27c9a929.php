<?php if($customFields): ?>
    <h5 class="col-12 pb-4"><?php echo trans('lang.main_fields'); ?></h5>
<?php endif; ?>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Amount Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('amount', trans("lang.wallet_transaction_amount"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::number('amount', null, ['class' => 'form-control','step'=>'any', 'min'=>'0', 'placeholder'=> trans("lang.wallet_transaction_amount_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.wallet_transaction_amount_help")); ?>

            </div>
        </div>
    </div>

    <!-- Description Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('description', trans("lang.wallet_transaction_description"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('description', null,  ['class' => 'form-control','placeholder'=>  trans("lang.wallet_transaction_description_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.wallet_transaction_description_help")); ?>

            </div>
        </div>
    </div>

</div>
<div class="d-flex flex-column col-sm-12 col-md-6">

    <!-- Action Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('action', trans("lang.wallet_transaction_action"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('action', ['credit' => __('lang.wallet_transaction_credit'),'debit' => __('lang.wallet_transaction_debit')], null, ['class' => 'select2 form-control']); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.wallet_transaction_action_help")); ?></div>
        </div>
    </div>

    <!-- Wallet Id Field -->
    <div class="form-group align-items-center d-flex flex-column flex-md-row">
        <?php echo Form::label('wallet_id', trans("lang.wallet_transaction_wallet_id"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('wallet_id', $wallet, null, ['class' => 'select2 form-control']); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.wallet_transaction_wallet_id_help")); ?></div>
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
        <i class="fas fa-save"></i> <?php echo e(trans('lang.save')); ?> <?php echo e(trans('lang.wallet_transaction')); ?></button>
    <a href="<?php echo route('walletTransactions.index'); ?>" class="btn btn-default"><i class="fas fa-undo"></i> <?php echo e(trans('lang.cancel')); ?></a>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/wallet_transactions/fields.blade.php ENDPATH**/ ?>