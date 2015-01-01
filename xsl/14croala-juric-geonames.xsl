<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14croala-juric-geonames.xsl remove empty printing city entries -->
    <!-- Jovanovic, started working on it 22/01/14 -->
    
    <xsl:template match="comment()|processing-instruction()|text()">
        <xsl:copy/>
    </xsl:template>
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//lemma[(n[node()] and l[starts-with(text(), 'cnl') and not(contains(text(), ' '))])]" />
    
    
    </xsl:stylesheet>

