<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/dm_project/stylesheet/stylesheet.css?v.2.6" rel="stylesheet" media="screen" />
    <link href="catalog/view/theme/dm_project/stylesheet/popup_cart.css?v.2.6" rel="stylesheet" media="screen" />
    <link href="catalog/view/theme/dm_project/stylesheet/animate.css" rel="stylesheet" type="text/css">
    <link href="catalog/view/theme/dm_project/stylesheet/rub.css" rel="stylesheet" type="text/css">
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <script src="catalog/view/theme/dm_project/js/common.js?v.2.6" type="text/javascript"></script>
    <script src="catalog/view/theme/dm_project/js/service.js?v.2.6" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php if ($analytics) { ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
    <?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div id="preloader">
    <img alt="preLoader" src="image/preload/ring-alt.svg"/>
</div>
<script type="text/javascript">
    $('#preloader').fadeIn().show();
    $(window).load(function() {
        setTimeout(function () {
            $("#preloader").delay(100).fadeOut().hide();
        }, 400);
    });
</script>
<div class="container-fluid">
    <div class="row">
        <nav id="top">
            <div class="container">
                <?php echo $currency; ?>
                <?php echo $language; ?>
                <div class="header-phone pull-left">
                    <img src="/image/icons/phone-icon.png" class="hidden-xs" alt="Phone"><span><?php echo $telephone; ?></span>
                </div>
                <div id="top-links" class="logged nav pull-right">
                    <ul class="list-inline list-unstyled">
                        <li class="user-icon hidden-xs"><img src="/image/icons/user-icon.png" alt="Phone"></li>
                        <?php if ($logged) { ?>
                        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_account; ?> <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                <li><button type="button" onclick="AjaxLogout();" class="logout"><?php echo $text_logout; ?></button></li>
                            </ul>
                        </li>
                        <?php } else { ?>
                        <li><button type="button" onclick="getPopupLogin();"><?php echo $text_login; ?></button></li>
                        <li class="green-line"></li>
                        <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<header>
    <div class="container">
        <div class="row row-5">
            <div class="col-md-1 col-sm-2 col-padding-5">
                <div id="logo">
                    <?php if ($logo) { ?>
                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                    <?php } else { ?>
                    <a href="<?php echo $home; ?>"><?php echo $name; ?></a>
                    <?php } ?>
                </div>
            </div>
            <div class="col-md-5 col-sm-6 col-padding-5"><?php echo $search; ?></div>
            <div class="col-md-3 hidden-sm hidden-xs col-padding-5">
                <div class="information-list text-right">
                    <ul class="list-inline">
                        <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><img src="/image/icons/shipping-icon.png" alt="Payment and Shipping"> <span><?php echo $information['title']; ?></span></a></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-padding-5"><?php echo $cart; ?></div>
        </div>
    </div>
</header>
<?php if ($categories) { ?>
<div class="container-fluid">
    <div class="row">
        <nav id="menu-desktop" class="navbar visible-sm visible-md visible-lg">
            <div class="container">
                <table class="nav navbar-nav">
                    <tbody>
                    <tr>
                        <?php foreach ($categories as $category) { ?>
                        <td ><a href="<?php echo $category['href']; ?>" class="<?php echo $category['active'] ? 'active' : 'not-active'; ?>"><?php echo $category['name']; ?></a></td>
                        <?php } ?>
                    </tr>
                    </tbody>
                </table>
            </div>
        </nav>
        <nav id="menu" class="navbar visible-xs">
            <div class="container">
                <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <?php foreach ($categories as $category) { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<?php } ?>
