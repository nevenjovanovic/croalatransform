(: get a document from the collection :)
for $a in db:open("osman")/*:aligned-text[not(descendant::*:word)]
(: get the xslt stylesheet :)
let $xsl := "/home/neven/rad/croala-r/croalatransform/xsl/align-postag.xsl"

return replace node $a with xslt:transform($a, $xsl)