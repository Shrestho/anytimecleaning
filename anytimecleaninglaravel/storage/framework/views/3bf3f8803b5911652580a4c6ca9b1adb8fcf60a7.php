<div class='btn-group btn-group-sm'>
    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('eProviderTypes.show')): ?>
        <a data-toggle="tooltip" data-placement="left" title="<?php echo e(trans('lang.view_details')); ?>" href="<?php echo e(route('eProviderTypes.show', $id)); ?>" class='btn btn-link'>
            <i class="fas fa-eye"></i> </a>
    <?php endif; ?>

    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('eProviderTypes.edit')): ?>
        <a data-toggle="tooltip" data-placement="left" title="<?php echo e(trans('lang.e_provider_type_edit')); ?>" href="<?php echo e(route('eProviderTypes.edit', $id)); ?>" class='btn btn-link'>
            <i class="fas fa-edit"></i> </a>
    <?php endif; ?>

    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('eProviderTypes.destroy')): ?>
        <?php echo Form::open(['route' => ['eProviderTypes.destroy', $id], 'method' => 'delete']); ?>

        <?php echo Form::button('<i class="fas fa-trash"></i>', [
        'type' => 'submit',
        'class' => 'btn btn-link text-danger',
        'onclick' => "return confirm('Are you sure?')"
        ]); ?>

        <?php echo Form::close(); ?>

    <?php endif; ?>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/e_provider_types/datatables_actions.blade.php ENDPATH**/ ?>