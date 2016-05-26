<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 1511croala-drama-p-sp: copy everything, transform div/@type=scena / p to sp : -->
    <!-- note/@place='foot' , ref, num -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:div[@type='drama-scena']/tei:p/tei:hi">
        <speaker>
            <xsl:apply-templates select="node()"/>
        </speaker>
    </xsl:template>
    <xsl:template match="//tei:div[@type='drama-scena']/tei:p/text()[preceding-sibling::tei:hi]">
        <p>
            <xsl:copy/>
        </p>
    </xsl:template>
    <xsl:template match="//tei:div[@type='drama-scena']/tei:p[tei:hi]">
        <sp>
            <xsl:apply-templates select="@*|node()"/>
        </sp>
    </xsl:template>
</xsl:stylesheet>

