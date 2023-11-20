<div class='btn-group btn-group-sm'>
    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('permissions.edit')): ?>
        <a href="<?php echo e(route('permissions.edit', $id)); ?>" class='btn btn-link'> <i class="fas fa-edit"></i> </a>
    <?php endif; ?>
    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('permissions.destroy')): ?>
        <?php echo Form::open(['route' => ['permissions.destroy', $id], 'method' => 'delete']); ?>

        <?php echo Form::button('<i class="fas fa-trash"></i>', [
            'type' => 'submit',
            'class' => 'btn btn-link text-danger',
            'onclick' => "return confirm('Are you sure?')"
        ]); ?>

        <?php echo Form::close(); ?>

    <?php endif; ?>
</div>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/settings/permissions/datatables_actions.blade.php ENDPATH**/ ?>