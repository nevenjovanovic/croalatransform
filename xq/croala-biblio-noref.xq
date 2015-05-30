for $i in //*:body//*:author[not(*:ref)]
order by $i/text()[1]
return element n { $i/.. }