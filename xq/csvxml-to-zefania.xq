(: csv xml to Zefania format :)
for $d in distinct-values(//*:record/*:orig_book_index)
let $verses := //*:record[orig_book_index[matches(text(), $d)]]
return <BIBLEBOOK bnumber="{$d}">{
         for $i in distinct-values($verses/*:orig_chapter)
         let $chapters := $verses[orig_chapter[matches(text(), $i)]]
         return <CHAPTER cnumber="{$i}">
         { 
         for $v in $chapters
         where $chapters/*:orig_chapter[matches(text(), $i)]
         return <VERS vnumber="{$v/*:orig_verse}">
         { data($v/*:text) }
         </VERS> }
         </CHAPTER>
       }</BIBLEBOOK>