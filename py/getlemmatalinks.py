#!/usr/bin/python
from __future__ import print_function
"""getlemmatalinks.py: Parse a list of NLW lemmata, return links. Output RDF saying: 
This URI is a lexical entry, it has the following form; the form has a written form of...
<http://www.neulatein.de/words/3/009979.htm> a ns2:lexicalEntry ;
    ns2:form [ ns2:writtenForm "rumigeratio" ] .
"""


__author__ = 'Neven Jovanovic'
__copyright__ = "Neven Jovanovic, Zagreb, Hrvatska"
__credits__ = ["Neven Jovanovic"]
__license__ = "CC-BY"
__version__ = "0.0.1"
__maintainer__ = "Neven Jovanovic"
__email__ = "neven.jovanovic@ffzg.hr"
__status__ = "Prototype"


import os
from bs4 import BeautifulSoup
from rdflib import URIRef, BNode, Literal, Graph, Namespace
from rdflib.namespace import RDF , DC

# Add prefix to local links
prefix = "http://www.neulatein.de/";
# initialize RDF graph and lemon and croala namespaces
nlwgraph = Graph()
lemon = Namespace("http://lemon-model.net/lemon#")
croala = Namespace("http://croala.ffzg.unizg.hr/nlw#")
dots = "../"
# A list of HTML pages, downloaded locally, to scrape
popis = [
"lemmata/lem_a.htm",
"lemmata/lem_b.htm",
"lemmata/lem_c.htm",
"lemmata/lem_d.htm",
"lemmata/lem_e.htm",
"lemmata/lem_f.htm",
"lemmata/lem_g.htm",
"lemmata/lem_h.htm",
"lemmata/lem_i.htm",
"lemmata/lem_k.htm",
"lemmata/lem_l.htm",
"lemmata/lem_m.htm",
"lemmata/lem_n.htm",
"lemmata/lem_o.htm",
"lemmata/lem_p.htm",
"lemmata/lem_q.htm",
"lemmata/lem_r.htm",
"lemmata/lem_s.htm",
"lemmata/lem_t.htm",
"lemmata/lem_u.htm",
"lemmata/lem_x.htm",
"lemmata/lem_y.htm",
"lemmata/lem_z.htm"
]
# Define the NLW lexicon
nlwgraph.add((croala.lexicon,RDF.type,lemon.Lexicon))
nlwgraph.add((croala.lexicon,DC.source,URIRef('http://www.neulatein.de')))
# open files from list, parse them as HTML objects, find a tags
for req in popis:
    html = open(req,'r').read()
    soup = BeautifulSoup(html,'lxml')
    links = soup.find_all('a')
# for each a tag, get its text (lemma entry) and value of href (link to entry / citation)
# transform them into objects for RDF statements, saying
# 1. the URI is a lexical entry
# 2. the URI has the form of description
# 3. the description has a written representation of the lemma entry
# (it turns out that in the NLW several entries can point to the same URI)
    for l in links:
        wordform = Literal(l.get_text(),lang="la") # all lemmata are in Latin
        worduri = URIRef(prefix + l['href'][3:])
        description = BNode()
        nlwgraph.add((croala.lexicon,lemon.entry,worduri))
        nlwgraph.add((worduri,RDF.type,lemon.LexicalEntry))
        nlwgraph.add((worduri,lemon.Form,description))
        nlwgraph.add((description,lemon.writtenRep,wordform))
# add the RDF statements to our graph
nlwttl = open("nlwlist.ttl", "w")
# serialize the graph in turtle format, write it to file
print(nlwgraph.serialize(format='turtle'), file=nlwttl)
