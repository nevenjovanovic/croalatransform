<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14croala-bib-ana-djela.xsl add @ana with "opera" to listBibl -->
    <!-- Jovanovic, started working on it 26/03/14 -->
        <!-- includes XSLT Template to copy anything, faster -->
        <!-- source: tei wiki and http://www.xmlplease.com/xsltidentity (nice examples!) -->
    <xsl:template match="comment()|processing-instruction()|text()">
        <xsl:copy/>
    </xsl:template>
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="//tei:body//tei:listBibl">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:attribute name="ana">croala.opera</xsl:attribute>
                <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
            </xsl:copy>
        
    </xsl:template>
    </xsl:stylesheet>

