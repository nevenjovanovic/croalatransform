<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- copy everything, copy second floruit to element death -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:person/tei:floruit[2][matches(tei:date/text(), '[0-9]{4}')]">
        <xsl:element name="TEI:floruit" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="when" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="replace(./tei:date/text(), '[^\d{4}]', '')"/></xsl:attribute>
            <xsl:value-of select="/tei:date"/>
            <xsl:apply-templates/>
        </xsl:element>
        <xsl:element name="TEI:death" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="when" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="replace(./tei:date/text(), '[^\d{4}]', '')"/></xsl:attribute>
            <xsl:value-of select="/tei:date"/> 
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
    
</xsl:stylesheet>

