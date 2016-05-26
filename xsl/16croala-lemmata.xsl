<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 16croala-lemmata: copy everything, add w elements to words, keep punctuation -->
    <xsl:include href="copy.xsl"/>
    
    <xsl:template match="//*:text//text()">
    <xsl:analyze-string select="." regex="\w+">
        <xsl:matching-substring><xsl:element name="w" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="."/></xsl:element></xsl:matching-substring>
        <xsl:non-matching-substring>
            <xsl:value-of select="."/>
        </xsl:non-matching-substring>
    </xsl:analyze-string>
    </xsl:template>
    
</xsl:stylesheet>

