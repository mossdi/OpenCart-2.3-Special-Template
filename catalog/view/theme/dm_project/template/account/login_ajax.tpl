<div id="popup-login">
  <fieldset>
    <div class="form-group">
      <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
    </div>
    <div class="form-group">
      <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
    </div>
    <button type="button" id="btn-login" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>"><?php echo $button_login; ?></button>
  </fieldset>
</div>
<script type="text/javascript"><!--
$('#popup-login').on('click', '#btn-login', function () {
    var email = $('#popup-login input[name=\'email\']').val();
    var password = $('#popup-login input[name=\'password\']').val();

    $.ajax({
        url: 'index.php?route=account/login_ajax/validate',
        type: 'POST',
        data: { 'email': email, 'password': password },
        dataType: 'json',
        beforeSend: function () {
            $('#btn-login').button('loading');
            $('.alert').remove();
        },
        success: function (json) {
            if (json['warning']) {
                $('#popup-login').prepend('<div class="alert alert-danger">' + json['warning'] + '</div>');
                $('#btn-login').button('reset');
            } else {
                location.reload();
            }
        }
    });
});
//--></script>