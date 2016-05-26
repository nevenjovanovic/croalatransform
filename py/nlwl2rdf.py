#!/usr/bin/python
from __future__ import print_function
"""nlwl2rdf.py: Parse XML exported from BaseX. Output RDF saying: 
This URI is a lexical entry, it has the following form; the form has a written form of...
<http://www.neulatein.de/words/3/009979.htm> ns2:lexicalEntry ;
    ns2:form [ ns2:writtenForm "rumigeratio" ] .
"""


__author__ = "Neven Jovanovic"
__copyright__ = ["Neven Jovanovic, Zagreb, Croatia", "Johann Ramminger, Munich, Germany"]
__credits__ = ["Neven Jovanovic", "Johann Ramminger"]
__license__ = "CC-BY"
__version__ = "0.0.1"
__maintainer__ = "Neven Jovanovic"
__email__ = "neven.jovanovic@ffzg.hr"
__status__ = "Prototype"


import os
from lxml import etree
from rdflib import URIRef, BNode, Literal, Graph, Namespace
from rdflib.namespace import RDF , DC


# initialize RDF graph and lemon and croala namespaces
nlwxmlgraph = Graph()
lemon = Namespace("http://lemon-model.net/lemon#")
croala = Namespace("http://croala.ffzg.unizg.hr/nlw#")
prefix = "http://"
# Define the NLW lexicon
nlwxmlgraph.add((croala.lexicon,RDF.type,lemon.Lexicon))
nlwxmlgraph.add((croala.lexicon,DC.source,URIRef('http://www.neulatein.de')))
# open file, parse it as XML object, find entry elements
xml = etree.parse("/home/neven/rad/nlwl/2016-05-nlwl-lexicon.xml")
links = xml.findall('entry')
# for each entry element, get its mainform (lemma entry) and value of @urn (link to entry / citation)
# transform them into objects for RDF statements, saying
# 1. the URI is a lexical entry
# 2. the URI has the form of description
# 3. the description has a written representation of the lemma entry
# (it turns out that in the NLW several entries can point to the same URI)
for l in links:
    wordstring = u"".join(l.xpath("./forms/mainform/text()")).encode("utf8").strip()
    wordform = Literal(wordstring,lang="la") # all lemmata are in Latin
    stringuri = "".join(l.xpath("./@urn"))
    worduri = URIRef(stringuri)
    description = BNode()
    nlwxmlgraph.add((croala.lexicon,lemon.entry,worduri))
    nlwxmlgraph.add((worduri,RDF.type,lemon.LexicalEntry))
    nlwxmlgraph.add((worduri,lemon.Form,description))
    nlwxmlgraph.add((description,lemon.writtenRep,wordform))
    otherforms = l.xpath("./forms/other/text()")
    for o in otherforms:
        formstring = u"".join(o).encode("utf8").strip()
        nlwxmlgraph.add((description,lemon.writtenRep,Literal(formstring,lang="la")))
# add the RDF statements to our graph
nlwttl = open("nlwxml.ttl", "w")
# serialize the graph in turtle format, write it to file
print(nlwxmlgraph.serialize(format="turtle"), file=nlwttl)
