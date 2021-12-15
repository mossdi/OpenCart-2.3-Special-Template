<?php if ($filters_attribute) { ?>
<div class="row row-5">
    <div class="attributes-filter">
        <?php foreach($filters_attribute as $filter_attribute) { ?>
        <div class="col-md-2 col-sm-4 col-xs-6 col-padding-5">
            <div class="form-group input-group input-group-sm">
                <label class="input-group-addon"><?php echo $filter_attribute['group_name']; ?></label>
                <select id="input-limit" class="form-control" onchange="location = this.value;">
                    <option <?php echo empty($filter_selected[$filter_attribute['group_id']]) ? 'selected' : ''; ?> value="<?php echo $filter_attribute['disable']; ?>"><?php echo $text_select; ?></option>
                    <?php foreach($filter_attribute['attributes'] as $attribute) { ?>
                    <?php if (!empty($filter_selected[$filter_attribute['group_id']]) && mb_strtolower($filter_selected[$filter_attribute['group_id']]) == mb_strtolower($attribute['value'])) { ?>
                    <option value="<?php echo $attribute['href']; ?>" selected="selected"><?php echo $attribute['value']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $attribute['href']; ?>"><?php echo $attribute['value']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<?php } ?>
