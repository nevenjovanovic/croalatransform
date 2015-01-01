<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 14ghlh-sent-milestone-corresp: create corresp from Stephanus numbers in milestones  -->
    <!-- todo: use text() from ref as part of ctstxt variable value -->
    
    <xsl:include href="copy.xsl"/>
    <xsl:variable name="ctstxt">tlg0059.tlg030.perseus-grc</xsl:variable>
    
    <xsl:template match="//*:body//*:seg">
        <xsl:variable name="stephanus" select="(preceding::*:milestone[matches(@n, '[0-9]+a')][1] | ancestor::*/*:milestone[matches(@n, '[0-9]+a')][1])[last()]/@n"/> 
        
        <xsl:copy>
            <xsl:attribute name="corresp" select="concat($ctstxt,$stephanus)"/>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template> 
</xsl:stylesheet>

