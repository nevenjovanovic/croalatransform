<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- l-add-met-pentameter: add @met='pentameter' to every other l element -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:text/tei:body/tei:div[@met='elegiacum']/tei:l[position() mod 2 = 0 and not(@met)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="met">pentameter</xsl:attribute> 
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>

