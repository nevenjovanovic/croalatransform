<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 13croala-bib-target.xsl insert ref/@target into selected author nodes -->
    <!-- Jovanovic, started working on it 07/01/14 -->
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
    
    <xsl:variable name="ime" select="'Dudić, Andrija'"/>
    <xsl:variable name="autorID" select="'dudic01'"/>
    
    <xsl:template match="//tei:body//tei:author[not(tei:ref) and contains(text()[1], $ime)]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:element name="ref" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="target"><xsl:value-of select="$autorID"></xsl:value-of></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/></xsl:element>
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

