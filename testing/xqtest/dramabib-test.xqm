module namespace test = 'http://basex.org/modules/xqunit-tests';
import module namespace drama = "http://www.ffzg.unizg.hr/klafil/drama" at 'file://home/neven/basex/repo/drama.xqm';
(: dramabib-test - display bibliography on Croatian Latin drama :)

(: return info on the db :)
declare %unit:test %unit:ignore function test:croalabib-dramabib-page() {
  fetch:xml("http://localhost:8984/basex/dramabib")
};

(: return page with bib title and refs :)
declare %unit:test function test:croalabib-dramabib-title-refs() {
  fetch:xml("http://localhost:8984/basex/dramabib-titleref/batu%C5%A1i%C4%87n1978a")
};

(: return page with bib title and refs :)
declare %unit:test function test:croalabib-dramabib-titleref-div() {
  let $titleref := doc("http://localhost:8984/basex/dramabib-titleref/batu%C5%A1i%C4%87n1978a")
  return unit:assert($titleref//div[matches(@class,'zapis')]/h1)
};

declare %unit:test %unit:ignore function test:croalabib-dramabib-jumbotron-dbinfo() {
  let $page := doc("http://localhost:8984/basex/dramabib")
  return unit:assert($page//*:title[.='CroALaBib dramata: opera docta'])
};

declare %unit:test %unit:ignore function test:croalabib-wdata-invoke-function-getbibliolist() {
  let $function := drama:getbibliolist('croalabib')//*:tbody/*:tr/*:td[1]
  return unit:assert($function)
};

declare %unit:test  %unit:ignore function test:croalabib-wdata-invoke-function-getbiblioref() {
  let $function := drama:getbiblioref('#šenoa1876')
  return $function
};

declare %unit:test %unit:ignore function test:croalabib-wdata-invoke-function-getbibliolist-date() {
  let $function := drama:getbibliolist('croalabib')//*:tbody/*:tr/*:td[2]
  return unit:assert($function)
};

declare %unit:test %unit:ignore function test:croalabib-dramabib-head-tablesorter() {
  let $page := doc("http://localhost:8984/basex/dramabib")
  return unit:assert($page//head/script[@src='https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.23.5/js/jquery.tablesorter.min.js'])
};

declare %unit:test function test:croalabib-dramabib-body-tablesorter-script() {
  let $page := doc("http://localhost:8984/basex/dramabib")
  return unit:assert($page//body/script)
};

declare %unit:test function test:croalabib-dramabib-body-table-head-td1() {
  let $page := doc("http://localhost:8984/basex/dramabib")//div[comment()[.=' insert function call here ']]/table[@class='tablesorter']/thead/tr
  return unit:assert($page/td[.='Annus' and following-sibling::td[.='Titulus'] and following-sibling::td[.='Dramata']])
};

declare %unit:test %unit:ignore function test:croalabib-dramabib-body-table-tbody-td1-dates() {
  let $page := doc("http://localhost:8984/basex/dramabib")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/tbody/tr/td[1][text()])
};


declare %unit:test function test:croalabib-dramabib-body-table-tbody-td3() {
  let $page := doc("http://localhost:8984/basex/dramabib")//div[comment()[.=' insert function call here ']]/table/tbody
  return unit:assert($page/tr/td[3]/a[matches(@href,'dramabib-titleref')])
};

declare %unit:test %unit:ignore function test:croalabib-dramabib-body-table-tbody-td3-0() {
  let $page := doc("http://localhost:8984/basex/dramabib")
  return unit:assert($page//div[comment()[.=' insert function call here ']]/table/tbody/tr/td[3][.='0'])
};