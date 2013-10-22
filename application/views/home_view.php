<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.min.css">
        <style>
            body {
                padding-top: 68px;
            }
        </style>
        <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>css/main.css">

        <script src="<?php echo base_url(); ?>js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"><label>Dealer login</label></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <img src="img/logo.png" width="146" height="38"/>

                    <div class="nav-collapse collapse">
                        <form class="navbar-form pull-right">
                            <label>Dealer login</label>
                            <input class="span2" type="text" placeholder="Email">
                            <input class="span2" type="password" placeholder="Password">
                            <button type="submit" class="btn">Sign in</button>
                        </form>
                    </div><!--/.nav-collapse -->

                </div>

            </div>
            <div class="heading-bar">
                <h1>Mobile Spray Rigs</h1>
                <a href="http://www.cjspray.com/pdfs/cjs_mobile_rigs.pdf"><i class="icon-download icon-white"></i>Catalog</a>
            </div>
        </div>

        <div class="container-fluid">
            <ul id="pageTabs" class="nav nav-tabs">
                <li class="active"><a href="#trailers" data-toggle="tab">Trailers</a></li>
                <li class=""><a href="#options" data-toggle="tab">Options</a></li>
                <li class=""><a href="#accessories" data-toggle="tab">Accessories</a></li>
                <li class=""><a href="#complete" data-toggle="tab">Finish</a></li>
            </ul>
        </div>

        <div id="main-container" class="container-fluid no-selections">
            <div class="row-fluid">
                <div id="main-content" class="span8">
                    <div id="pageTabsContent" class="tab-content">
                    
                        <!-- Trailers -->
                        <div class="tab-pane active in" id="trailers">
                            <ul class="thumbnails">
                                <?php $option = $options[1] ?>
                                <?php foreach($option->choices as $choice): ?>
                                <li class="trailer" 
                                    data-id="<?= $choice->id; ?>" 
                                    data-label="<?= $choice->label; ?>" 
                                    data-option-index="<?= $option->index; ?>" 
                                    data-option-id="<?= $option->id; ?>" 
                                    data-option-label="<?= $option->label; ?>" 
                                    data-price="<?= $choice->price; ?>" 
                                    data-dealer-price="<?= $choice->dealer_price; ?>" >
                                    <div class="thumbnail">
                                        <a class="fancybox fancybox.iframe" href="<?php echo base_url(); ?>home/info/<?php echo $choice->info_index; ?>/<?php echo $choice->label; ?>"><i class="icon-info-sign icon-white"></i></a>
                                        <?php $image_url = base_url().config_item("image_dir_path").urldecode( $choice->image ); ?>
                                        <img data-src="<?php echo $image_url ?>" src="<?php echo $image_url ?>" alt=""/>
                                        <h3><?php echo urldecode( $choice->label ); ?></h3>
                                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo odio dui. </p>
                                    </div>
                                </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>

                        <!-- Options -->
                        <div class="tab-pane fade in" id="options">
                            <div class="accordion" id="options">
                            <?php foreach($options as $option): if(intval($option->index) > 2): ?>
                                <div class="accordion-group" data-id="<?= $option->id; ?>" >
                                    <div class="accordion-heading">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#options" href="#option<?php echo $option->index?>">
                                        <?php echo urldecode( $option->label ) ?>
                                        </a>
                                    </div>
                                    <div id="option<?php echo $option->index?>" class="accordion-body collapse">
                                        <div class="btn-group btn-group-vertical" data-toggle="buttons-radio">
                                            <?php foreach($option->choices as $choice): ?>
                                            <div>
                                                <a class="fancybox fancybox.iframe" href="<?php echo base_url(); ?>home/info/<?php echo $choice->info_index; ?>/<?php echo $choice->label; ?>"><i class="icon-info-sign"></i></a>
                                                <button 
                                                    data-id="<?= $choice->id; ?>" 
                                                    data-label="<?= $choice->label; ?>" 
                                                    data-option-index="<?= $option->index; ?>" 
                                                    data-option-id="<?= $option->id; ?>" 
                                                    data-option-label="<?= $option->label; ?>" 
                                                    data-price="<?= $choice->price; ?>" 
                                                    data-dealer-price="<?= $choice->dealer_price; ?>" 
                                                    type="button" 
                                                    class="btn">
                                                    <?php echo urldecode($choice->label); ?>
                                                </button>
                                            </div>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                </div>
                            <?php endif; endforeach; ?>
                            </div>
                        </div>

                        <!-- Accessories -->
                        <div class="tab-pane fade in" id="accessories">
                            <div class="btn-group btn-group-vertical" data-toggle="buttons-checkbox">
                                <?php $option = $options[0]; ?>
                                <?php foreach($option->choices as $choice): ?>
                                <div>
                                    <a class="fancybox fancybox.iframe" href="<?php echo base_url(); ?>home/info/<?php echo $choice->info_index; ?>"><i class="icon-info-sign"></i></a>
                                    <button 
                                        data-id="<?= $choice->id; ?>" 
                                        data-label="<?= $choice->label; ?>" 
                                        data-option-index="<?= $option->index; ?>" 
                                        data-option-id="<?= $option->id; ?>" 
                                        data-option-label="<?= $option->label; ?>" 
                                        data-price="<?= $choice->price; ?>" 
                                        data-dealer-price="<?= $choice->dealer_price; ?>"
                                        type="button" 
                                        class="btn">
                                        <?php echo rawurldecode($choice->label); ?>
                                    </button>
                                </div>
                                <?php endforeach; ?>
                            </div>
                        </div>

                        <!-- Complete -->
                        <div class="tab-pane fade in" id="complete">
                            <div id="full-configuration" class="span12 configuration-content">
                                
                                <div class="container-fluid">
                                    <div class="row-fluid">
                                        <div class="span6">
                                            <h3>My Rig <span class="price">$0</span></h3>
                                            <ul class="part-number"><h4>Part Number:</h4>
                                                <?php foreach($options as $option): if($option->index > 1): ?>
                                                <li class="inactive" data-id="<?= $option->id; ?>" data-index="<?= $option->index; ?>"></li>
                                                <?php endif; endforeach; ?>
                                            </ul>
                                            <ul class="items"><h4>Options:</h4></ul>
                                            <ul class="accessories"><h4>Accessories:</h4></ul>
                                        </div>
                                        <div class="span6">
                                            <?php $image_url = base_url().config_item("image_dir_path")."B-A.jpg"; ?>
                                            <img data-src="<?php echo $image_url ?>" src="<?php echo $image_url ?>" alt=""/>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end config container -->
                            <div class="btn-group nav-buttons">
                                    <button class="btn" onClick="main.activateTab('trailers')">Download</button>
                                    <button class="btn" onClick="main.activateTab('trailers')">Print</button>
                                    <button class="btn" onClick="main.activateTab('trailers')">Start Over</button>
                                </div>

                        </div>
                    </div>
                </div><!-- end page container -->

                <div id="mini-configuration" class="span4 configuration-content">
                    <div class="thumbnail">
                        <?php $image_url = base_url().config_item("image_dir_path")."B-A.jpg"; ?>
                        <h3>My Rig <span class="price">$</span></h3>
                        <ul class="part-number"><h4>Part Number:</h4>
                            <?php foreach($options as $option): if($option->index > 1): ?>
                            <li class="inactive" data-id="<?= $option->id; ?>" data-index="<?= $option->index; ?>"></li>
                            <?php endif; endforeach; ?>
                        </ul>
                        <img data-src="<?php echo $image_url ?>" src="<?php echo $image_url ?>" alt=""/>
                        <ul class="items"><h4>Options:</h4></ul>
                        <ul class="accessories"><h4>Accessories:</h4></ul>
                    </div>
                </div><!-- end config container -->
            </div>
        </div> <!-- / main container -->

        

        <!-- Add jQuery library -->
        <script type="text/javascript" src="<?php echo base_url(); ?>js/vendor/jquery-1.10.1.min.js"></script>

        <!-- Add mousewheel plugin (this is optional) -->
        <script type="text/javascript" src=".<?php echo base_url(); ?>js/vendor/jquery.mousewheel-3.0.6.pack.js"></script>

        <!-- Add fancyBox main JS and CSS files -->
        <script type="text/javascript" src="<?php echo base_url(); ?>js/vendor/fancybox/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>js/vendor/fancybox/jquery.fancybox.css?v=2.1.5" media="screen" />

        <!-- Add Button helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>js/vendor/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
        <script type="text/javascript" src="<?php echo base_url(); ?>js/vendor/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

        <!-- Add Thumbnail helper (this is optional) -->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>js/vendor/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
        <script type="text/javascript" src="<?php echo base_url(); ?>js/vendor/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

        <!-- Add Media helper (this is optional) -->
        <script type="text/javascript" src="<?php echo base_url(); ?>js/vendor/fancybox/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

        <script src="<?php echo base_url(); ?>js/vendor/bootstrap.min.js"></script>

        <script src="<?php echo base_url(); ?>js/plugins.js"></script>
        <script src="<?php echo base_url(); ?>js/main.js"></script>

        <script>
            var _gaq=[['_setAccount','<?php echo GA_ACCOUNT; ?>'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
    </body>
</html>
