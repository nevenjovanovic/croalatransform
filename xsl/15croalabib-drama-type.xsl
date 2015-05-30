<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 13croalabib-drama-type.xsl add @type=drama to all bib entries -->
    <!-- Jovanovic, started working on it 29/04/15 -->
        <!-- includes XSLT Template to copy anything, faster -->
    <xsl:template match="comment()|processing-instruction()|text()">
        <xsl:copy/>
    </xsl:template>
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//tei:body/tei:div/tei:listBibl[contains(@ana,'croala.opera')]/tei:bibl|tei:biblStruct">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
                <xsl:attribute name="type">opus</xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

