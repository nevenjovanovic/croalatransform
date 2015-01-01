let $croala := ('http://www.ffzg.unizg.hr/klafil/croala/cgi-bin/search3t?dbname=croala&amp;filename=REPLACE')
let $urn := <ls><edition urn="urn:cts:croALa:croalaget003.croalaget001.izdzagreb">
      <label xml:lang="hrv">Osman</label>
      <online docname="getaldic-v-osmanides.xml"/>
</edition></ls>
for $i in $urn/*:edition[@urn="urn:cts:croALa:croalaget003.croalaget001.izdzagreb"]
return doc(replace($croala,'REPLACE',data($i/*:online/@docname)))