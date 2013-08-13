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
                padding-top: 80px;
                padding-bottom: 40px;
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
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <img src="img/logo.png" width="146" height="38"/>

                    <div class="nav-collapse collapse">
                        <form class="navbar-form pull-right">
                            <input class="span2" type="text" placeholder="Email">
                            <input class="span2" type="password" placeholder="Password">
                            <button type="submit" class="btn">Sign in</button>
                        </form>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <div class="container">
            <ul id="pageTabs" class="nav nav-tabs hide">
                <li class="active"><a href="#home" data-toggle="tab">Start</a></li>
                <li class=""><a href="#trailers" data-toggle="tab">Trailers</a></li>
                <li class=""><a href="#options" data-toggle="tab">Options</a></li>
                <li class=""><a href="#accessories" data-toggle="tab">Accessories</a></li>
                <li class=""><a href="#complete" data-toggle="tab">Complete</a></li>
            </ul>
        </div>

        <div class="container">
            <div class="row">
                <div id="main-content" class="span12">
                    <div id="pageTabsContent" class="tab-content">
                        <div class="tab-pane fade active in" id="home">
                            <div class="hero-unit">
                                <h1>Mobile Spray Rig Configurator</h1>
                                <p>Self-Contained Systems for Foam and Coating Applications</p>
                                <a class="btn btn-primary btn-large" onClick="main.activateTab('trailers')">Get Started &raquo;</a>
                            </div>
                            <hr>
                        </div>

                        <!-- Trailers -->
                        <div class="tab-pane fade in" id="trailers">
                            <div class="hero-unit">
                                <h2>Trailers</h2> 
                            </div>
                            <ul class="thumbnails">
                                <?php foreach($data_xml->options->option[1]->choice as $choice): ?>
                                <li class="span4">
                                    <div class="thumbnail">
                                        <ul class="nav nav-pills">
                                            <li><a class="fancybox fancybox.iframe" href="home/info/<?php echo $choice->attributes()->info_index; ?>">?</a></li>
                                        </ul>
                                        <?php $image_url = base_url().config_item("image_dir_path").urldecode( $choice->attributes()->image ); ?>
                                        <img data-src="<?php echo $image_url ?>" src="<?php echo $image_url ?>" alt=""/>
                                        <h3><?php echo urldecode( $choice->label ); ?></h3>
                                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo odio dui. </p>
                                    </div>
                                </li>
                                <?php endforeach; ?>
                            </ul>
                            <hr>
                            <div class="btn-group">
                                <button class="btn" onClick="main.activateTab('home')">Back</button>
                                <button class="btn" onClick="main.activateTab('options')">Next</button>
                            </div>
                        </div>

                        <!-- Options -->
                        <div class="tab-pane fade in" id="options">
                            <div class="hero-unit">
                                <h2>Options</h2> 
                            </div>
                            <div class="accordion" id="options">
                            <?php foreach($data_xml->options->option as $option): if($option->attributes()->index > 2): ?>
                                <div class="accordion-group">
                                    <div class="accordion-heading">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#options" href="#option<?php echo $option->attributes()->index?>">
                                        <?php echo urldecode( $option->label ) ?>
                                        </a>
                                    </div>
                                    <div id="option<?php echo $option->attributes()->index?>" class="accordion-body collapse">
                                        <div class="btn-group btn-group-vertical" data-toggle="buttons-radio">
                                            <?php foreach($option->choice as $choice): ?>
                                            <div>
                                                <ul class="nav nav-pills">
                                                    <li><a class="fancybox fancybox.iframe" href="home/info/<?php echo $choice->attributes()->info_index; ?>">?</a></li>
                                                </ul>
                                                <button type="button" class="btn">
                                                    <?php echo urldecode($choice->label); ?>
                                                </button>
                                            </div>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                </div>
                            <?php endif; endforeach; ?>
                            </div>
                            <hr>
                            <div class="btn-group">
                                <button class="btn" onClick="main.activateTab('trailers')">Back</button>
                                <button class="btn" onClick="main.activateTab('accessories')">Next</button>
                            </div>
                        </div>

                        <!-- Accessories -->
                        <div class="tab-pane fade in" id="accessories">
                            <div class="hero-unit">
                                <h2>Accessories</h2> 
                            </div>
                            <div class="btn-group btn-group-vertical" data-toggle="buttons-checkbox">
                                <?php foreach($data_xml->options->option[0]->choice as $choice): ?>
                                <div>
                                    <ul class="nav nav-pills">
                                        <li><a class="fancybox fancybox.iframe" href="home/info/<?php echo $choice->attributes()->info_index; ?>">?</a></li>
                                    </ul>
                                    <button type="button" class="btn"><?php echo urldecode($choice->label); ?></button>
                                </div>
                                <?php endforeach; ?>
                            </div>
                            <hr>
                            <div class="btn-group">
                                <button class="btn" onClick="main.activateTab('options')">Back</button>
                                <button class="btn" onClick="main.activateTab('complete')">Finish</button>
                            </div>
                        </div>

                        <!-- Complete -->
                        <div class="tab-pane fade in" id="complete">
                            <div class="hero-unit">
                                <h2>Your Rig</h2> 
                            </div>
                            <hr>
                            <div class="btn-group">
                                <button class="btn" onClick="main.activateTab('accessories')">Back</button>
                                <button class="btn" onClick="main.activateTab('home')">Start Over</button>
                            </div>
                        </div>
                    </div>
                </div><!-- end page container -->

                <div id="configuration-content" class="span4 hide">
                    <div class="hero-unit">
                        <h2>Current Configuration</h2>
                    </div>
                    <div class="thumbnail">
                        <?php $image_url = base_url().config_item("image_dir_path")."B-A.jpg"; ?>
                        <h3>Heading</h3>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <img data-src="<?php echo $image_url ?>" src="<?php echo $image_url ?>" alt=""/>
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
