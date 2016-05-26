let $files :=
let $text := file:read-text('/home/neven/ownCloud/photos/henrik8evandjelistar/h8ptifs.csv')
return csv:parse($text, map { 'header': true() })
for $f in $files//record
let $ime := replace(data($f/filename), '\.tif', '')
let $adr := data($f/filename)
return 

<html lang="en">

 <head>
  <meta charset="utf-8" />
  <meta name="DC.creator" content="Ruven Pillay &lt;ruven@users.sourceforge.netm&gt;"/>
  <meta name="DC.title" content="IIPMooViewer 2.0: HTML5 High Resolution Image Viewer"/>
  <meta name="DC.subject" content="IIPMooViewer; IIPImage; Visualization; HTML5; Ajax; High Resolution; Internet Imaging Protocol; IIP"/>
  <meta name="DC.description" content="IIPMooViewer is an advanced javascript HTML5 image viewer for streaming high resolution scientific images"/>
  <meta name="DC.rights" content="Copyright: 2003-2015 Ruven Pillay"/>
  <meta name="DC.source" content="http://iipimage.sourceforge.net"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
  <meta http-equiv="X-UA-Compatible" content="IE=9" />

  <link rel="stylesheet" type="text/css" media="all" href="css/iip.min.css" />
<!--[if lt IE 10]>
  <meta http-equiv="X-UA-Compatible" content="IE=9" >
  <link rel="stylesheet" type="text/css" media="all" href="css/ie.min.css" />
<![endif]-->

  <!-- Basic example style for a 100% view -->
  <style type="text/css">
    
  </style>

  <link rel="shortcut icon" href="images/iip-favicon.png" />
  <link rel="apple-touch-icon" href="images/iip.png" />

  <title>Henrici regis VIII Evangelistarium: {$ime}</title>

  <script type="text/javascript" src="js/mootools-core-1.5.2-compressed.js"></script>
  <script type="text/javascript" src="js/iipmooviewer-2.0-min.js"></script>

<!--[if lt IE 7]>
  <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE7.js">IE7_PNG_SUFFIX = ".png";</script>
<![endif]-->

  <script type="text/javascript">

    // IIPMooViewer options: See documentation at http://iipimage.sourceforge.net for more details
    // Server path: set if not using default path
    var server = '/fcgi-bin/iipsrv.fcgi';

    // The *full* image path on the server. This path does *not* need to be in the web
    // server root directory. On Windows, use Unix style forward slash paths without
    // the "c:" prefix
    var image = '/home/njovanov/slike/h8ptif/{$adr}';

    // Copyright or information message
    var credit = 'Henrici regis Evangelistarium: editio CC-BY';

    // Create our iipmooviewer object
    new IIPMooViewer( "viewer", {
	server: server,
	image: image,
	credit: credit
    });

  </script>

 </head>

 <body>
   <div id="viewer"></div>
 </body>

</html>
