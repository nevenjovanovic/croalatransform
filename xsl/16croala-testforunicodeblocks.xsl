<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 16croala-testforunicodeblocks: test text//text() nodes for characters from certain Unicode blocks -->
    
    <xsl:template match="//*:text//text()">
        <xsl:if test="matches(., '[^\p{IsBasicLatin}\p{IsLatin-1Supplement}\p{Z}\s]')">
            <xsl:message>Characters from non-Latin Unicode blocks in <xsl:value-of select="base-uri(.)"/></xsl:message>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>

