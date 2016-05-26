<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 1511croalabib-opus-id: copy everything, create @xml:id value where missing, but not in composite works : -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:div/tei:listBibl[matches(@ana,'croala.opera')]/tei:bibl[not(@xml:id)and not(tei:note[@type='status' and .='compositum'])]"><xsl:copy>
        <xsl:attribute name="xml:id"><xsl:value-of select="concat(../@xml:id,'.',generate-id() )"/></xsl:attribute>
            <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

