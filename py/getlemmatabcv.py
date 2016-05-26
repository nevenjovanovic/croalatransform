#!/usr/bin/python
# -*- coding: utf-8 -*-
from __future__ import print_function
"""getlemmatabcv.py: Parse a csv of lemmata from Bunić, Čobarnić, Vičić. 
Output RDF saying: 
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
import pandas as pd
from rdflib import URIRef, BNode, Literal, Graph, Namespace
from rdflib.namespace import RDF , DC

# Add prefix to local links
prefix = "http://www.neulatein.de/";
# initialize RDF graph and lemon and croalans namespaces
croalagraph = Graph()
lemon = Namespace("http://lemon-model.net/lemon#")
croalans = Namespace("http://croala.ffzg.unizg.hr/croalans#")
df = pd.read_csv("/home/neven/rad/nlwl/150516bun-cob-vic-onomata_lem.csv")

# Define the CroALa lexicon
croalagraph.add((croalans.onomasticon,RDF.type,lemon.Lexicon))
croalagraph.add((croalans.onomasticon,DC.source,URIRef('http://croala.ffzg.unizg.hr')))

# Get unique lemmata (for now, don't think about homonyms)
for l in df.Lemma.unique():

# transform them into objects for RDF statements, saying
# 1. the URI is a lexical entry
# 2. the URI has the form of description
# 3. the description has a written representation of the lemma entry

        wordform = Literal(l,lang="la") # all lemmata are in Latin
        worduri = URIRef("http://croala.ffzg.unizg.hr/thesauri/urn:cite:croala:nomen:" + l)
        description = BNode()
        croalagraph.add((croalans.onomasticon,lemon.entry,worduri))
        croalagraph.add((worduri,RDF.type,lemon.LexicalEntry))
        croalagraph.add((worduri,lemon.Form,description))
        croalagraph.add((description,lemon.writtenRep,wordform))
# add the RDF statements to our graph
croalattl = open("bcvlist2.ttl", "w")
# serialize the graph in turtle format, write it to file
print(croalagraph.serialize(format='turtle'), file=croalattl)
