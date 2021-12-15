<ul class="breadcrumb">
    <?php $breadcount = count($breadcrumbs) - 1; ?>
    <?php foreach ($breadcrumbs as $iterator => $breadcrumb) { ?>
    <?php if ($iterator == $breadcount - 1) { ?>
    <li class="penult"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } elseif ($iterator == $breadcount) { ?>
    <li class="end"><a href="<?php echo $breadcrumb['href']; ?>"></a><span><?php echo $breadcrumb['text']; ?></span></li>
    <?php } else { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
    <?php } ?>
</ul>
