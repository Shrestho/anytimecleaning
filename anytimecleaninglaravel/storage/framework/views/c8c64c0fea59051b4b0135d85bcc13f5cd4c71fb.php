<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-<?php echo e(setting('theme_contrast')); ?>-<?php echo e(setting('theme_color')); ?> shadow">
    <!-- Brand Logo -->
    <a href="<?php echo e(url('dashboard')); ?>" class="brand-link border-bottom-0 <?php echo e(setting('logo_bg_color','bg-white')); ?>">
        <img src="<?php echo e($app_logo ?? ''); ?>" alt="<?php echo e(setting('app_name')); ?>" class="brand-image">
        <span class="brand-text font-weight-light"><?php echo e(setting('app_name')); ?></span> </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-flat" data-widget="treeview" role="menu" data-accordion="false">
                <?php echo $__env->make('layouts.menu',['icons'=>true], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
<?php /**PATH C:\wamp\www\cleanany\resources\views/layouts/sidebar.blade.php ENDPATH**/ ?>