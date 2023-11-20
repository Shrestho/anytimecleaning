<?php if($customFields): ?>
    <h5 class="col-12 pb-4"><?php echo trans('lang.main_fields'); ?></h5>
<?php endif; ?>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Image Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('avatar', trans("lang.user_avatar"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <div style="width: 100%" class="dropzone avatar" id="avatar" data-field="avatar">
                <input type="hidden" name="avatar">
            </div>
            <a href="#loadMediaModal" data-dropzone="avatar" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-<?php echo e(setting('theme_color','primary')); ?> btn-sm float-right mt-1"><?php echo e(trans('lang.media_select')); ?></a>
            <div class="form-text text-muted w-50">
                <?php echo e(trans("lang.user_avatar_help")); ?>

            </div>
        </div>
    </div>
    <?php $__env->startPrepend('scripts'); ?>
    <script type="text/javascript">
        var user_avatar = '';
        <?php if(isset($provider) && $provider->hasMedia('avatar')): ?>
            user_avatar = {
            name: "<?php echo $provider->getFirstMedia('avatar')->name; ?>",
            size: "<?php echo $provider->getFirstMedia('avatar')->size; ?>",
            type: "<?php echo $provider->getFirstMedia('avatar')->mime_type; ?>",
            collection_name: "<?php echo $provider->getFirstMedia('avatar')->collection_name; ?>"
        };
                <?php endif; ?>
        var dz_user_avatar = $(".dropzone.avatar").dropzone({
                url: "<?php echo url('uploads/store'); ?>",
                addRemoveLinks: true,
                maxFiles: 1,
                init: function () {
                    <?php if(isset($provider) && $provider->hasMedia('avatar')): ?>
                    dzInit(this, user_avatar, '<?php echo url($provider->getFirstMediaUrl('avatar','thumb')); ?>')
                    <?php endif; ?>
                },
                accept: function (file, done) {
                    dzAccept(file, done, this.element, "<?php echo config('medialibrary.icons_folder'); ?>");
                },
                sending: function (file, xhr, formData) {
                    dzSending(this, file, formData, '<?php echo csrf_token(); ?>');
                },
                maxfilesexceeded: function (file) {
                    dz_user_avatar[0].mockFile = '';
                    dzMaxfile(this, file);
                },
                complete: function (file) {
                    dzComplete(this, file, user_avatar, dz_user_avatar[0].mockFile);
                    dz_user_avatar[0].mockFile = file;
                },
                removedfile: function (file) {
                    dzRemoveFile(
                        file, user_avatar, '<?php echo url("users/remove-media"); ?>',
                        'avatar', '<?php echo isset($provider) ? $provider->id : 0; ?>', '<?php echo url("uplaods/clear"); ?>', '<?php echo csrf_token(); ?>'
                    );
                }
        });
        dz_user_avatar[0].mockFile = user_avatar;
        dropzoneFields['avatar'] = dz_user_avatar;
    </script>
    <?php $__env->stopPrepend(); ?>

<!-- Name Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('name', trans("lang.e_provider_name"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.e_provider_name_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.e_provider_name_help")); ?>

            </div>
        </div>
    </div>

    <!-- Description Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('description', trans("lang.e_provider_description"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
             trans("lang.e_provider_description_placeholder")  ]); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.e_provider_description_help")); ?></div>
        </div>
    </div>

</div>
<div class="d-flex flex-column col-sm-12 col-md-6">

    <!-- Email Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('email', 'email', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::email('email', null,  ['class' => 'form-control','placeholder'=>  "Insert email"]); ?>

            <div class="form-text text-muted">
                <?php echo e("Insert email"); ?>

            </div>
        </div>
    </div>

    <!-- Phone Number Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('phone_number', trans("lang.e_provider_phone_number"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('phone_number', null,  ['class' => 'form-control','placeholder'=>  trans("lang.e_provider_phone_number_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.e_provider_phone_number_help")); ?>

            </div>
        </div>
    </div>
    <!-- Mobile Number Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('mobile_number', trans("lang.e_provider_mobile_number"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::text('mobile_number', null,  ['class' => 'form-control','placeholder'=>  trans("lang.e_provider_mobile_number_placeholder")]); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.e_provider_mobile_number_help")); ?>

            </div>
        </div>
    </div>

    <!-- Addresses Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('addresses[]', trans("lang.e_provider_addresses"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('addresses[]', $address, $addressesSelected, ['class' => 'select2 form-control' , 'multiple'=>'multiple']); ?>

            <div class="form-text text-muted">
                <?php echo e(trans("lang.e_provider_addresses_help")); ?>

                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('addresses.create')): ?>
                    <a href="<?php echo e(route('addresses.create')); ?>" class="text-success float-right"><?php echo e(__('lang.address_create')); ?></a>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <!-- Taxes Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <?php echo Form::label('taxes[]', trans("lang.e_provider_taxes"),['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <?php echo Form::select('taxes[]', $tax, $taxesSelected, ['class' => 'select2 form-control' , 'multiple'=>'multiple']); ?>

            <div class="form-text text-muted"><?php echo e(trans("lang.e_provider_taxes_help")); ?></div>
        </div>
    </div>

    <!-- Availability Range Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row ">
        <?php echo Form::label('availability_range', trans("lang.e_provider_availability_range"), ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

        <div class="col-md-9">
            <div class="input-group">
                <?php echo Form::number('availability_range', null, ['class' => 'form-control','step'=>'any', 'min'=>'0', 'placeholder'=> trans("lang.e_provider_availability_range_placeholder")]); ?>

                <div class="input-group-append">
                    <div class="input-group-text text-bold px-3"><?php echo e(trans("lang.app_setting_".setting('distance_unit','mi'))); ?></div>
                </div>
            </div>
            <div class="form-text text-muted">
                <?php echo e(trans("lang.e_provider_availability_range_help")); ?>

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
    <?php if(auth()->check() && auth()->user()->hasRole('admin')): ?>
    <div class="d-flex flex-row justify-content-between align-items-center">
        <?php echo Form::label('accepted', trans("lang.e_provider_accepted"),['class' => 'control-label my-0 mx-3']); ?> <?php echo Form::hidden('accepted', 0, ['id'=>"hidden_accepted"]); ?>

        <span class="icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('accepted', 1, null); ?> <label for="accepted"></label> </span>
    </div>
    <?php endif; ?>
    <div class="d-flex flex-row justify-content-between align-items-center">
        <?php echo Form::label('available', trans("lang.e_provider_available"),['class' => 'control-label my-0 mx-3']); ?> <?php echo Form::hidden('available', 0, ['id'=>"hidden_available"]); ?>

        <span class="icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('available', 1, null); ?> <label for="available"></label> </span>
    </div>
    <div class="d-flex flex-row justify-content-between align-items-center">
        <?php echo Form::label('featured', trans("lang.e_provider_featured"),['class' => 'control-label my-0 mx-3']); ?> <?php echo Form::hidden('featured', 0, ['id'=>"hidden_featured"]); ?>

        <span class="icheck-<?php echo e(setting('theme_color')); ?>">
            <?php echo Form::checkbox('featured', 1, null); ?> <label for="featured"></label> </span>
    </div>
    <button type="submit" class="btn bg-<?php echo e(setting('theme_color')); ?> mx-md-3 my-lg-0 my-xl-0 my-md-0 my-2">
        <i class="fa fa-save"></i> <?php echo e(trans('lang.save')); ?> <?php echo e(trans('lang.e_provider')); ?></button>
    <a href="<?php echo route('eProviders.index'); ?>" class="btn btn-default"><i class="fa fa-undo"></i> <?php echo e(trans('lang.cancel')); ?></a>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/e_providers/fields.blade.php ENDPATH**/ ?>