<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 14ghlh-sent-tokenizer: tokenize sentences inside p, add corresp from ctstxt variable  -->
    <!-- todo: use text() from ref as part of ctstxt variable value -->
    
    <xsl:include href="copy.xsl"/>
    <xsl:variable name="ctstxt">phi0474.phi037.perseus-lat1:xx</xsl:variable>
    
    <xsl:template match="//tei:div/tei:p//text()[not(parent::tei:ref)]">
        <xsl:variable name="sentence" select="normalize-space(string-join(., ' '))"></xsl:variable>
        <xsl:analyze-string select="$sentence" regex=".*?[.?!]+”*">
            <xsl:matching-substring>
                <xsl:element name="seg" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="corresp" select="$ctstxt"/>
                <xsl:value-of select="."/>
                </xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template> 
</xsl:stylesheet>

