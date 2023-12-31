<?php if($customFields): ?>
    <h5 class="col-12 pb-4"><?php echo trans('lang.main_fields'); ?></h5>
<?php endif; ?>
<div class="d-flex flex-column col-sm-12 col-md-6">

    <!-- Booking Status Id Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('booking_status_id', trans("lang.booking_booking_status_id"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('booking_status_id', $bookingStatus, null, ['class' => 'select2 form-control']); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.booking_booking_status_id_help")); ?></div>
        </div>
    </div>

    <!-- Address Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('address_id', trans("lang.booking_address"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('address_id', $addresses, null, ['class' => 'select2 form-control']); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.booking_address_help")); ?></div>
        </div>
    </div>

    <!-- Payment Status Id Field -->
    <?php if(!empty($paymentStatuses)): ?>
        <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
            <?php echo Form::label('payment_status_id', trans("lang.booking_payment_id"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

            <div class="col-md-9">
                <?php echo Form::select('payment_status_id', $paymentStatuses, null, ['class' => 'select2 form-control']); ?>

                <div class="form-text text-muted"><?php echo e(trans("lang.booking_payment_id_help")); ?></div>
            </div>
        </div>
<?php endif; ?>

<!-- Hint Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('hint', trans("lang.booking_hint"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::textarea('hint', null, ['class' => 'form-control','placeholder'=>
             trans("lang.booking_hint_placeholder")  ]); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.booking_hint_help")); ?></div>
        </div>
    </div>

</div>
<div class="d-flex flex-column col-sm-12 col-md-6">

    <!-- Booking At Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('booking_at', trans("lang.booking_booking_at"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <div class="input-group datepicker booking_at" data-target-input="nearest">
                <?php echo Form::text('booking_at', null,  ['class' => 'form-control datetimepicker-input','placeholder'=>  trans("lang.booking_booking_at_placeholder"), 'data-target'=>'.datepicker.booking_at','data-toggle'=>'datetimepicker','autocomplete'=>'off']); ?>

                <div id="widgetParentId"></div>
                <div class="input-group-append" data-target=".datepicker.booking_at" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fas fa-business-time"></i></div>
                </div>
            </div>
            <div class="form-text text-muted">
                <?php echo e(trans("lang.booking_booking_at_help")); ?>

            </div>
        </div>
    </div>

    <!-- Start At Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('start_at', trans("lang.booking_start_at"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <div class="input-group datepicker start_at" data-target-input="nearest">
                <?php echo Form::text('start_at', null,  ['class' => 'form-control datetimepicker-input','placeholder'=>  trans("lang.booking_start_at_placeholder"), 'data-target'=>'.datepicker.start_at','data-toggle'=>'datetimepicker','autocomplete'=>'off']); ?>

                <div id="widgetParentId"></div>
                <div class="input-group-append" data-target=".datepicker.start_at" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fas fa-business-time"></i></div>
                </div>
            </div>
            <div class="form-text text-muted">
                <?php echo e(trans("lang.booking_start_at_help")); ?>

            </div>
        </div>
    </div>

    <!-- Ends At Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('ends_at', trans("lang.booking_ends_at"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <div class="input-group datepicker ends_at" data-target-input="nearest">
                <?php echo Form::text('ends_at', null,  ['class' => 'form-control datetimepicker-input','placeholder'=>  trans("lang.booking_ends_at_placeholder"), 'data-target'=>'.datepicker.ends_at','data-toggle'=>'datetimepicker','autocomplete'=>'off']); ?>

                <div id="widgetParentId"></div>
                <div class="input-group-append" data-target=".datepicker.ends_at" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fas fa-business-time"></i></div>
                </div>
            </div>
            <div class="form-text text-muted">
                <?php echo e(trans("lang.booking_ends_at_help")); ?>

            </div>
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
    <div class="d-flex flex-row justify-content-between align-items-center">
        <?php echo Form::label('cancel', trans("lang.booking_cancel"),['class' => 'control-label my-0 mx-3']); ?> <?php echo Form::hidden('cancel', 0, ['id'=>"hidden_cancel"]); ?>

        <span class="icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('cancel', 1, null); ?> <label for="cancel"></label> </span>
    </div>

    <button type="submit" class="btn bg-<?php echo e(setting('theme_color')); ?> mx-md-3 my-lg-0 my-xl-0 my-md-0 my-2">
        <i class="fas fa-save"></i> <?php echo e(trans('lang.save')); ?> <?php echo e(trans('lang.booking')); ?></button>
    <a href="<?php echo route('bookings.index'); ?>" class="btn btn-default"><i class="fas fa-undo"></i> <?php echo e(trans('lang.cancel')); ?></a>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/bookings/fields.blade.php ENDPATH**/ ?>