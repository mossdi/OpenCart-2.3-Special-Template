<?php if ($review_status || $description) { ?>
<div id="tab-nav-tabs" class="col-xs-12">
    <ul id="product-nav-tabs" class="nav nav-tabs">
        <?php if ($description) { ?>
        <li><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
        <?php } ?>
        <?php if ($nav_informations) { ?>
        <?php foreach ($nav_informations as $nav_information) { ?>
        <li><a href="#tab-information-<?php echo $nav_information['id']; ?>" data-toggle="tab"><?php echo $nav_information['title']; ?></a></li>
        <?php } ?>
        <?php } ?>
        <?php if ($review_status) { ?>
        <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
        <?php } ?>
    </ul>
    <div id="product-tab-content" class="tab-content">
        <?php if ($description) { ?>
        <div id="tab-description" class="tab-pane fade">
            <?php echo $description; ?>
        </div>
        <?php } ?>
        <?php if ($nav_informations) { ?>
        <?php foreach ($nav_informations as $nav_information) { ?>
        <div id="tab-information-<?php echo $nav_information['id']; ?>" class="tab-pane fade"><?php echo $nav_information['description']; ?></div>
        <?php } ?>
        <?php } ?>
        <?php if ($review_status) { ?>
        <div id="tab-review" class="tab-pane fade">
            <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                        <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label"><?php echo $entry_rating; ?></label>
                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                        <input type="radio" name="rating" value="1" />
                        &nbsp;
                        <input type="radio" name="rating" value="2" />
                        &nbsp;
                        <input type="radio" name="rating" value="3" />
                        &nbsp;
                        <input type="radio" name="rating" value="4" />
                        &nbsp;
                        <input type="radio" name="rating" value="5" />
                        &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                    <div class="pull-right">
                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                    </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
            </form>
            <script type="text/javascript"><!--
            $('#review').delegate('.pagination a', 'click', function(e) {
                e.preventDefault();

                $('#review').fadeOut('slow');

                $('#review').load(this.href);

                $('#review').fadeIn('slow');
            });

            $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

            $('#button-review').on('click', function() {
                $.ajax({
                    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
                    type: 'post',
                    dataType: 'json',
                    data: $("#form-review").serialize(),
                    beforeSend: function() {
                        $('#button-review').button('loading');
                    },
                    complete: function() {
                        $('#button-review').button('reset');
                    },
                    success: function(json) {
                        $('.alert-success, .alert-danger').remove();

                        if (json['error']) {
                            $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                            $('input[name=\'name\']').val('');
                            $('textarea[name=\'text\']').val('');
                            $('input[name=\'rating\']:checked').prop('checked', false);
                        }
                    }
                });
            });
            //--></script>
        </div>
        <?php } ?>
    </div>
    <script type="text/javascript"><!--
    $("ul#product-nav-tabs li:first").addClass("active");
    $("div#product-tab-content .tab-pane:first").addClass("active in");
    //--></script>
</div>
<?php } ?>