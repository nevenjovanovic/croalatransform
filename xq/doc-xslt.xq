(: get a document from the collection :)
let $a := db:open("osman","get-osman-1-29-30.xml")
(: get the xslt stylesheet :)
let $xsl := "/home/neven/rad/croala-r/croalatransform/xsl/align-postag.xsl"

return xslt:transform($a, $xsl)