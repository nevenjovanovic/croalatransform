<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="yes" /> 
    <!-- exclude unnecessary tei tags -->
    <xsl:include href="copy.xsl"/>
    <!-- remove following -->
    <xsl:template match="//*:note|*:del|*:ref[text()]|*:bibl|*:num"/>
    <!-- remove parts -->
    <xsl:template match="//*:choice/*:sic|*:orig[position()>1]|*:unclear[1]"/>
    <xsl:template match="//*:app/*:rdg[position()>1]"/>
    <!-- exclude empty elements -->
    <xsl:template match=
        "*[not(text())]
        "/>
    <!-- exclude note elements and children -->
</xsl:stylesheet>

