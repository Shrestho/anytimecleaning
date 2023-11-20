<!-- email Field -->
<div class="form-group row col-6">
    <?php echo Form::label('email', 'email:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $contact->email; ?></p>
    </div>
</div>

<!-- subject Field -->
<div class="form-group row col-6">
    <?php echo Form::label('subject', 'Subject:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $contact->subject; ?></p>
    </div>
</div>

<!-- phone Price Field -->
<div class="form-group row col-6">
    <?php echo Form::label('phone_number', 'Phone:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $contact->phone_number; ?></p>
    </div>
</div>

<!-- Message Field -->
<div class="form-group row col-6">
    <?php echo Form::label('message', 'Message:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $contact->message; ?></p>
    </div>
</div>

<!-- Created At Field -->
<div class="form-group row col-6">
    <?php echo Form::label('created_at', 'Created At:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $contact->created_at; ?></p>
    </div>
</div>

<!-- Updated At Field -->
<div class="form-group row col-6">
    <?php echo Form::label('updated_at', 'Updated At:', ['class' => 'col-md-3 control-label text-md-right mx-1']); ?>

    <div class="col-md-9">
        <p><?php echo $contact->updated_at; ?></p>
    </div>
</div>

<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/contacts/show_fields.blade.php ENDPATH**/ ?>