<?php if($customFields): ?>
    <h5 class="col-12 pb-4"><?php echo trans('lang.main_fields'); ?></h5>
<?php endif; ?>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Title Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('title', trans("lang.experience_title"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('title', null,  ['class' => 'form-control','placeholder'=>  trans("lang.experience_title_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.experience_title_help")); ?>

            </div>
        </div>
    </div>

    <!-- E Provider Id Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('user_id', trans("lang.experience_e_provider_id"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
        <?php echo Form::text('user_id', $current_provider->name,  ['class' => 'form-control','placeholder'=>  trans("lang.experience_title_placeholder"), 'disabled' => 'disabled']); ?>

            <input type="hidden" name="user_id" value=<?php echo e(auth()->user()->id); ?>>
            <!-- <?php echo Form::select('e_provider_id', $eProvider, null, ['class' => 'select2 form-control']); ?> -->
            <!-- <div class="form-text text-muted"><?php echo e(trans("lang.experience_e_provider_id_help")); ?></div> -->
        </div>
    </div>

    <!-- Description Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('description', trans("lang.experience_description"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
             trans("lang.experience_description_placeholder")  ]); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.experience_description_help")); ?></div>
        </div>
    </div>
</div>
<!-- <div class="d-flex flex-column col-sm-12 col-md-6">



</div> -->
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
        <i class="fa fa-save"></i> <?php echo e(trans('lang.save')); ?> <?php echo e(trans('lang.experience')); ?></button>
    <a href="<?php echo route('experiences.index'); ?>" class="btn btn-default"><i class="fa fa-undo"></i> <?php echo e(trans('lang.cancel')); ?></a>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/experiences/fields.blade.php ENDPATH**/ ?>