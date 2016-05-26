let $content := element div {
  for $l in //*:bookmark[@url]
order by $l/@title
return element div {
  element p { data($l/@title) },
  element p { element a { attribute href { $l/@url} , data($l/@url)}}
}
}
return file:write('/home/neven/rad/croala-r/croalatransform/basexbootstrap/webapp/static/bibsonomy-linkpage.html' , <html>
  <head>
    <title>BibSonomy Links</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="../static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="../static/dbkreport.css"/>
  </head>
  <body text="#000000">
    <h1>BibSonomy Links</h1>
    <p>{ data(db:info("1601bibs")//databaseproperties/timestamp) }</p>
    { $content }
    </body>
    </html>
  )