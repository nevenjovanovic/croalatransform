<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 15croala-drame-id-for-bibl.xsl generate xml:id for bibl which lacks it -->
    <!-- Jovanovic, started working on it 28/08/15 -->
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
    
    <!-- model: bibl/@type and not xml:id -->
    
    <xsl:template match="//tei:bibl[@type='drama' and not(@xml:id)]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
                    <xsl:attribute name="xml:id"><xsl:value-of select="concat('croala.drama.',generate-id())"></xsl:value-of></xsl:attribute>
        <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

