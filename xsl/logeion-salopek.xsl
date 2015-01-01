<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- copy everything, number only the l elements, consecutively in each div -->
    <xsl:include href="copy.xsl"/>
    <!-- <xsl:template match="//hi[@rend='bold']">
        <xsl:element name="head">
            <xsl:value-of select="substring-before(foreign[1]/text(), ',')"/>
        </xsl:element>
        <xsl:copy-of select="."></xsl:copy-of>
    </xsl:template>
     -->
    <xsl:template match="//pron"/>
    <xsl:template match="//bibl/hi">
        <xsl:value-of select="text()"/>
    </xsl:template>
    <xsl:template match="//entryFree/head">
        <xsl:element name="head">
            <xsl:attribute name="ana">
                <xsl:value-of select="text()"></xsl:value-of>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

