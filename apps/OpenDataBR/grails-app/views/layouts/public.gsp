<!doctype html>
<html lang="pt">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="${message(code:'default.title')}"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Serif" type="text/css"/>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Sans:700" type="text/css"/>
        
        <link rel="stylesheet" href="${resource(dir:'yaml/core/', file:'base.min.css')}" type="text/css"/>
        <link rel="stylesheet" href="${resource(dir:'yaml/screen/', file:'screen-FULLPAGE-layout.css')}" type="text/css"/>
        <link rel="stylesheet" href="${resource(dir:'yaml/screen/', file:'typography.css')}" type="text/css"/>
        <link rel="stylesheet" href="${resource(dir:'yaml/navigation/', file:'vlist.css')}" type="text/css"/>
        <link rel="stylesheet" href="${resource(dir:'yaml/navigation/', file:'hlist.css')}" type="text/css"/>
        <!-- mobile viewport optimisation -->
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--[if lte IE 7]>
        <link rel="stylesheet" href="${resource(dir:'yaml/core/', file:'iehacks.min.css')}" type="text/css"/>
        <![endif]-->

        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <style type="text/css">
            body > header { min-width: 760px; }

            .ym-wrapper {
              max-width: 80em;
            }

            .ym-wbox { padding: 10px;  }
        </style>

        <script type="text/javascript">
          var _appUrl = "${createLink(url:'/', absolute:true)}";
        </script>

        <g:layoutHead/>
        <r:layoutResources />
    </head>
    <body class="${pageProperty(name:'body.class')}" style="${pageProperty(name:'body.style')}">
        <header>
            <div class="ym-wrapper">
                <div class="ym-wbox">
                    <h1>header</h1>
                </div>
            </div>
        </header>
        <nav>
            <div class="ym-wrapper">
                <div class="ym-wbox">
                    <div id="top-menu" class="ym-hlist">
                      <ul>
                        <li class="active"><strong>Active</strong></li>
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                      </ul>
                    </div>
                </div>
            </div>
        </nav>
        <div id="main">
            <div class="ym-wrapper">
                <div class="ym-wbox">
                    <g:layoutBody/>
                    
                </div>
            </div>
        </div>
        <footer>
            <div class="ym-wrapper">
                <div class="ym-wbox">
                    Footer
                </div>
            </div>
        </footer>
        <r:layoutResources />
    </body>
</html>