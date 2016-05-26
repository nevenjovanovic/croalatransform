<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 16ritter: copy everything, transform p@rend into dateline -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:div/tei:p[@rend='end']">
        <xsl:element name="dateline" namespace="http://www.tei-c.org/ns/1.0"><xsl:apply-templates select="node()"/></xsl:element>
    </xsl:template>
    <xsl:template match="//tei:p[tei:hi[@rend='underline']]">
        <xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:p/tei:hi[@rend='underline']">
        <xsl:element name="head" namespace="http://www.tei-c.org/ns/1.0"><xsl:apply-templates select="node()"/></xsl:element>
    </xsl:template>
    <xsl:template match="//tei:p[@rend='justify' and tei:head]">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    <xsl:template match="//tei:div/tei:p[tei:head]">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
</xsl:stylesheet>

