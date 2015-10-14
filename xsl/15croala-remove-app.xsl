<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 15croala-remove-app: copy everything, remove editorial additions: -->
    <!-- note/@place='foot' , ref, num -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:text//tei:note[@place='foot']|tei:num"/>
    <xsl:template match="//tei:text//tei:ref[@target]|tei:rs|tei:placeName|tei:persName">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>

