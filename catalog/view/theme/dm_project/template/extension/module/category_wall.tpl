<?php if ($categories) { ?>
<div class="container">
    <div id="category-wall" class="row">
        <?php $num = 1; ?>
        <?php foreach ($categories as $category) { ?>
        <div class="<?php echo ($num == 1 || $num == 6 || $num == 7) ? 'col-lg-6 col-md-6 col-sm-4 col-xs-12' : 'col-lg-3 col-md-3 col-sm-4 col-xs-12'; ?>">
            <div class="category-wall-item">
                <div class="image">
                    <a href="<?php echo $category['href']; ?>">
                        <img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" />
                        <span class="category-name"><?php echo $category['name']; ?></span>
                        <span class="green-square"></span>
                    </a>
                    <?php if ($category['children']) { ?>
                    <ul class="level-2 list-unstyled">
                        <?php foreach ($category['children'] as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                </div>
            </div>
        </div>
        <?php $num++; ?>
        <?php } ?>
    </div>
</div>
<?php } ?>