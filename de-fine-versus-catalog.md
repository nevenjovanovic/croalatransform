# De fine versus: catalog of queries and scripts

Scripts and queries used to compare clausulae in CroALa with those in Poeti d' Italia in lingua latina.

## Background

See the page of the [De fine versus](http://croala.ffzg.unizg.hr/croatica-tyrolensia/collections/defineversus/) paper for the RSA 2016 Boston conference.

## XQueries

We use these with [BaseX](http://basex.org/).

1. From all verses (l elements) in CroALa (croala0 XML db), create an XML database: [croalafv-create.xq](xq/croalafv-create.xq). Preserve only Latin verse (there are some Greek, Italian, and Croatian lines in the database). Use node id numbers to refer back to original croala0 loci.
2. Clean up other markup from l elements: [croalafv-postproc.xq](xq/croalafv-postproc.xq)
3. Tokenize the lines, preserve only one, two, or three last words (clausulae). Write to new databases. [croalafv-clausulae-1.xq](xq/croalafv-clausulae-1.xq), [croalafv-clausulae-2.xq](xq/croalafv-clausulae-2.xq), [croalafv-clausulae-3.xq](xq/croalafv-clausulae-3.xq)
4. Create a list of words (tokens) in clausulae dbs: [croalafv-wordlist.xq](xq/croalafv-wordlist.xq)
5. Group repeated clausulae together, prepare a report on how many times a clausula is repeated, with links to nodes in croala0 db: [croalafv-clausulae-uniq-dupl-group.xq](xq/croalafv-clausulae-uniq-dupl-group.xq) (the same query can be used to select unique clausulae, of course)
5. Send words to Perseus / Morpheus parser, write results to database: [croalafv-c1-morpheus-parse.xq](xq/croalafv-c1-morpheus-parse.xq) (this enables us to identify unparsed words, whether "strange", spelled differently, or errors and typos)

