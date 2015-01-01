<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 13croala-samo-id.xsl get only ids -->
    <!-- Jovanovic, started working on it 07/01/14 -->
        <!-- includes XSLT Template to copy anything, faster -->
        <!-- source: tei wiki and http://www.xmlplease.com/xsltidentity (nice examples!) -->
    <!-- result: <ref ime="Zaccaria, Julije" type="croala" target="zaccariad1e1944"/> -->
    <xsl:template match="//tei:body//tei:persName[not(@type) and @xml:lang='hrv' and contains(text(), ',')]">

            <xsl:element name="ref">
                <xsl:attribute name="ime"><xsl:value-of select="text()"/></xsl:attribute>
                <xsl:attribute name="type">croala0</xsl:attribute>
                <xsl:attribute name="target"><xsl:value-of select="../@xml:id"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
            </xsl:element>
    </xsl:template>
    
    <!-- remove all text -->
    <xsl:template match="text()"/>
    </xsl:stylesheet>

