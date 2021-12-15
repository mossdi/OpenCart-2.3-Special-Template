<?php if ($nextpay_error) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $nextpay_error; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } else { ?>
<h2><?php echo $text_instruction; ?></h2>
<div class="well well-sm"><?php echo $nextpay_instruction; ?></div>
<div class="buttons">
    <div class="pull-right">
        <button type="button" id="button-confirm" class="btn btn-primary"><?php echo $button_confirm; ?></button>
    </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
    $.ajax({
        type: 'get',
        url: 'index.php?route=extension/payment/nextpay/confirm',
        cache: false,
        beforeSend: function() {
            $('#button-confirm').button('loading');
        },
        complete: function() {
            $('#button-confirm').button('reset');
        },
        success: function() {
            fbq('track', 'Purchase');
            location = '<?php echo $continue; ?>';
        }
    });
});
//--></script>
