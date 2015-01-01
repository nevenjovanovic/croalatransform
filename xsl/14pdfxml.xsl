<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14pdfxml.xsl combine lines ending with hyphen -->
    <!-- Jovanovic, started working on it 14/05/14 -->
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
    <xsl:template match="//*:lb[not(@left)]"/>
    <xsl:template match="//text()">
        <xsl:value-of select="
            if (ends-with(.,'-'))
            then substring-before(.,'-')
            else if (not(ends-with(.,'-')))
            then  concat(., ' ')
            else()"/>
    </xsl:template>
    <xsl:template match="//*:lb[@*]">
        <xsl:element name="milestone">
            <xsl:attribute name="type">paragraph</xsl:attribute>
        </xsl:element>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

