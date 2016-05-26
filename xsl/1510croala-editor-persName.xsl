<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 1510croala-editor-persName: copy everything, add persName to editor teiHeader: -->
    <!-- note/@place='foot' , ref, num -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:teiHeader//tei:editor[not(tei:persName)]">
        <editor>
        <persName>
            <xsl:apply-templates select="@*|node()"/>
        </persName>
        </editor>
    </xsl:template>
</xsl:stylesheet>

