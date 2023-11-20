<!-- Id Field -->
<!-- <div class="form-group row col-6">
    <?php echo Form::label('id', 'Id:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $entry->id; ?></p>
    </div>
</div> -->

<!-- email Field -->
<div class="form-group row col-6">
    <?php echo Form::label('email', 'email:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $entry->email; ?></p>
    </div>
</div>

<!-- subject Field -->
<div class="form-group row col-6">
    <?php echo Form::label('subject', 'Subject:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $entry->subject; ?></p>
    </div>
</div>

<!-- phone Price Field -->
<div class="form-group row col-6">
    <?php echo Form::label('phone_number', 'Phone:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $entry->phone_number; ?></p>
    </div>
</div>

<!-- Message Field -->
<div class="form-group row col-6">
    <?php echo Form::label('message', 'Message:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $entry->message; ?></p>
    </div>
</div>

<!-- Created At Field -->
<div class="form-group row col-6">
    <?php echo Form::label('created_at', 'Created At:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $entry->created_at; ?></p>
    </div>
</div>

<!-- Updated At Field -->
<div class="form-group row col-6">
    <?php echo Form::label('updated_at', 'Updated At:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $entry->updated_at; ?></p>
    </div>
</div>

<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/entries/show_fields.blade.php ENDPATH**/ ?>