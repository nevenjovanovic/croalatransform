for $w in /table/tr/td[1]/b/text()[matches(.,'^AR.*')]
return collection("camenatidx")//div[h3/text()=$w]
