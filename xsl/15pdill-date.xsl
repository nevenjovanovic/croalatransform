<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 15pdill date - add @from and @to to Poeti d' Italia -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:titleStmt/tei:author/tei:date">
             <xsl:element name="{local-name()}" namespace="http://www.tei-c.org/ns/1.0">
                 <xsl:attribute name="from" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="concat(ancestor::tei:div[@type='poesis-liber']/@n ,  '.' , count(preceding-sibling::tei:l) + 1)"/></xsl:attribute>
                 <xsl:attribute name="to" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select=""/></xsl:attribute>
                 <xsl:apply-templates/>
             </xsl:element>
    </xsl:template> 
</xsl:stylesheet>

