<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 1605-add-placename-from-list: find placenames from a list, add placename element to string -->
    
    <xsl:include href="copy.xsl"/>
    <xsl:param name="placename">Tragurium</xsl:param>
    
    <xsl:template match="//tei:text//text()[matches(., $placename) and not(parent::*:placeName)]">
        <xsl:variable name="elValue" select="."/>
        <xsl:analyze-string select="$elValue" regex="{$placename}">
            <xsl:matching-substring>
                <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="regex-group(0)"/></xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:copy></xsl:copy>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
</xsl:stylesheet>

