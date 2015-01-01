declare namespace aligned-text="http://alpheios.net/namespaces/aligned-text";
declare function local:dispatch($node as node()) as item()* {
    typeswitch($node)
        case text() return $node
        case comment() return $node
        case element(aligned-text:aligned-text) return $node
        case element(aligned-text:language) return $node
        case element(aligned-text:sentence) return $node
        case element(aligned-text:wds) return $node
        case element(aligned-text:w) return $node
        case element(aligned-text:text) return local:text($node)
        case element(aligned-text:refs) return $node
        default return local:passthru($node)
};
declare function local:passthru($nodes as node()*) as item()* {
    for $node in $nodes/node() return local:dispatch($node)
};
declare function local:text($node as element (aligned-text:text)) as element() {
  let $morph := ('http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=lat&amp;word=REPLACE_WORD&amp;engine=morpheuslat')
  let $q := (doc(replace($morph, 'REPLACE_WORD',data(local:passthru($node)))))
    return element aligned-text:text { local:passthru($node) , $q//*:infl }
};
for $input in //*:wds[@lnum='L2']/*:w[1]/*
return 
  local:dispatch($input)