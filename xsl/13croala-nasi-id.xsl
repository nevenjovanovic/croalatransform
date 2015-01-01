<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 13croala-nasi-id.xsl add croala IDs as @target in ref elements to authors -->
    <!-- Jovanovic, started working on it 20/01/14 -->
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
    
    <xsl:variable name="ime" select="document('/home/neven/rad/croala-r/biblio/autori/juric-nostri-croala-id.xml')/a"/>
    
    <xsl:key name="viafkey" match="ref" use="@ime"/>
    
    
    
    <xsl:template match="//tei:body//tei:biblStruct[not(@type)]/tei:monogr/tei:author[not(tei:ref)]">
        <!-- get something to compare: -->
        <xsl:variable name="imeautora" select="text()"></xsl:variable>
        <xsl:element name="author" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:element name="ref" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="type">croala</xsl:attribute>
                <xsl:attribute name="target"><xsl:value-of select="key('viafkey',$imeautora,$ime)/@target"/></xsl:attribute>
                <!-- key must have the third element, setting the document context!!! -->
                <xsl:value-of select="key('viafkey',$imeautora,$ime)/@ime"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    </xsl:stylesheet>

