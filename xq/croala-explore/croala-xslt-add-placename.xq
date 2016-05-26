let $p := "Tragurium"
let $style := "/home/neven/rad/croala-r/croalatransform/xsl/1605-add-placename-from-list.xsl"
let $file := "/home/neven/rad/croala-r/tagusage/sisgor-g.de-situ.croala-op.xml"
return (
  xslt:transform($file, $style)
)