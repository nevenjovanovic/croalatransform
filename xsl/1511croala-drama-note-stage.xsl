<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 1511croala-drama-note-stage: copy everything, add stage to note : -->
    <!-- note/@place='foot' , ref, num -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:text/tei:body//tei:note[not(tei:stage)]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
        <stage>
            <xsl:apply-templates select="node()"/>
        </stage>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>

