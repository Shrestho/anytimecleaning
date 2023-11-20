<div class="ml-auto d-flex flex-row">
    <li class="nav-item dropdown">
        <a class="nav-link  dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-save"></i>
            <span class="d-lg-inline-block d-none"><?php echo e(trans('lang.export')); ?></span> </a>
        <div class="dropdown-menu">
            <a class="dropdown-item" id="exportCsvDatatable" href="#"> <i class="fas fa-file-csv mr-2"></i>CSV</a>
            <a class="dropdown-item" id="exportExcelDatatable" href="#"> <i class="fas fa-file-excel mr-2"></i>Excel</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" id="exportPdfDatatable" href="#"> <i class="fas fa-file-pdf mr-2"></i>PDF</a>
        </div>
    </li>
    <li id="colVisDatatable" class="nav-item dropdown keepopen">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-eye"></i>
            <span class="d-lg-inline-block d-none"><?php echo e(trans('lang.columns')); ?></span> </a>
        <div class="dropdown-menu">
            <?php $__currentLoopData = $dataTable->collection; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <a class="dropdown-item text-bold" href="#" data-column="<?php echo e($key); ?>"> <i class="fas fa-check mr-2"></i><?php echo e($item->title); ?></a>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="refreshDatatable" href="#"><i class="fas fa-sync-alt"></i>
            <span class="d-lg-inline-block d-none"><?php echo e(trans('lang.refresh')); ?></span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="printDatatable" href="#"><i class="fas fa-print"></i> <span class="d-lg-inline-block d-none"><?php echo e(trans('lang.print')); ?></span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="resetDatatable" href="#"><i class="fas fa-undo"></i> <span class="d-lg-inline-block d-none"><?php echo e(trans('lang.reset')); ?></span></a>
    </li>
</div>

<?php $__env->startPush('scripts'); ?>
    <script type="text/javascript">
        /**
         * load media when select collection changed
         */
        var params = [];
        var objParams = {};

        /**
         * initialise objParams with existing parameters in the url
         * @type  {string}
         */
            objParams = $.extend({}, params);
            objParams = $.param(objParams);

        $('#filter #selectFilter').on('select2:select', function (e) {
            $(e.params.data.element).parent('optgroup').children().each(function (element) {
                $(this)[0].selected = false;
            });
            $(e.params.data.element)[0].selected = true;

            $(this).trigger('change');
            params[$(e.params.data.element).data('key')] = $(e.params.data.element).attr('value');
            objParams = $.extend({}, params);
            objParams = $.param(objParams);
        });

        $('#filter #selectFilter').on('select2:unselect', function (e) {
            params[$(e.params.data.element).data('key')] = undefined;
            objParams = $.extend({}, params);
            objParams = $.param(objParams);
        });

        $('#filter #selectFilter').on("select2:closing", function (e) {
            window.location.href = window.location.href.split('?')[0] + "?" + objParams;
        });
</script>
<?php $__env->stopPush(); ?>
<?php /**PATH F:\xampp\htdocs\anytimecleaninglaravel\resources\views/layouts/right_toolbar.blade.php ENDPATH**/ ?>