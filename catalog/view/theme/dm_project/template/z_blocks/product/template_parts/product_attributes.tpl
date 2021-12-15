<div id="tab-attribute">
    <?php foreach ($attribute_groups as $attribute_group) { ?>
    <div class="dotted-background">
        <h2 class="tab-attribute-title"><?php echo $attribute_group['name']; ?></h2>
    </div>
    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
    <p><strong><?php echo $attribute['name']; ?>:</strong> <?php echo $attribute['text']; ?></p>
    <?php } ?>
    <?php } ?>
</div>
