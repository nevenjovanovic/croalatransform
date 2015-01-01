<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 14numbering-div-l-plus1: copy everything, add 1 to @n of the l elements -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:body//tei:div[@type='poesis-liber']/tei:l">
             <xsl:element name="{local-name()}" namespace="http://www.tei-c.org/ns/1.0">
                 <xsl:attribute name="n" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="@n + 1"/></xsl:attribute>
                 <xsl:apply-templates/>
             </xsl:element>
    </xsl:template> 
</xsl:stylesheet>

