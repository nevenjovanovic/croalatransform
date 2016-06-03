(: create a db of Ritter Vitezovic's files from ritter-epistolae :)
(: pull files directly from Github repository :)

let $body := (
"https://github.com/nevenjovanovic/ritter-epistolae/raw/master/data/ritter-1676a.xml",
"https://github.com/nevenjovanovic/ritter-epistolae/raw/master/data/ritter-1676b.xml",
"https://github.com/nevenjovanovic/ritter-epistolae/raw/master/data/ritter-1682.xml",
"https://github.com/nevenjovanovic/ritter-epistolae/raw/master/data/ritter-1701.xml",
"https://github.com/nevenjovanovic/ritter-epistolae/raw/master/data/ritter-1702.xml",
"https://github.com/nevenjovanovic/ritter-epistolae/raw/master/data/ritter-1703.xml",
"https://github.com/nevenjovanovic/ritter-epistolae/raw/master/data/ritter-1710.xml"
)

return db:create("vitezovic-epistolae2", $body , (), map { 'ftindex': true(), 'intparse': true(), 'stripns': true() })