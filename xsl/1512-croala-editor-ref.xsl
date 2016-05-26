<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 1512-croala-editor-ref: copy everything, add @type viaf, @target VIAFNO in editor : -->
    <xsl:include href="copy.xsl"/>
    
    <xsl:variable name="rezar" select="'Vladimir Rezar'"/>
    <xsl:variable name="viafno-rezar" select="'2726561'"/>
    <xsl:variable name="vukusic" select="'Luka Vukušić'"/>
    <xsl:variable name="viafno-vukusic" select="'305665942'"/>
    <xsl:variable name="jovanovic" select="'Neven Jovanović'"/>
    <xsl:variable name="viafno-jovanovic" select="'6913774'"/>
    <xsl:template match="//tei:titleStmt/tei:editor/tei:persName/tei:ref[not(@target) and matches(text(), $rezar)]"><xsl:copy>
        <xsl:attribute name="type">viaf</xsl:attribute>
        <xsl:attribute name="target"><xsl:value-of select="$viafno-rezar"/></xsl:attribute>
            <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

