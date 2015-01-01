<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 14ghlh-sent-tokenizer-grc: tokenize sentences, add corresp from ctstxt variable  -->
    <!-- todo: use text() from ref as part of ctstxt variable value -->
    
    <xsl:include href="copy.xsl"/>
    <xsl:variable name="ctstxt">tlg0059.tlg030.perseus-grc</xsl:variable>
    
    <xsl:template match="//*:body/*:div//text()">
        <xsl:variable name="sentence" select="normalize-space(string-join(., ' '))"></xsl:variable>
        <xsl:variable name="stephanus" select="./preceding-sibling::*:milestone[@n][1]/@n"></xsl:variable>
        <xsl:analyze-string select="$sentence" regex=".*?[.;]+”*">
            <xsl:matching-substring>
                <xsl:element name="seg">
                    <xsl:attribute name="corresp" select="concat($ctstxt,'-',$stephanus)"/>
                <xsl:value-of select="."/>
                </xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template> 
</xsl:stylesheet>

