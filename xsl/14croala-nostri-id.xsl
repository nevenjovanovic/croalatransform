<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 13croala-ext-viaf.xsl add viaf numbers as @target in ref elements to authors -->
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
    <xsl:variable name="datoteke" select="collection(concat('../biblio/autori/','?select=latinisti-prosopografija-dodaci.xml'))"/>
    <xsl:variable name="ime" select="$datoteke//tei:listPerson"/>
    
    <xsl:key name="viafkey" match="tei:persName[@xml:lang='hrv']" use="text()"/>
    
    
    
    <xsl:template match="//author">
        <!-- get something to compare: -->
        <xsl:variable name="imeautora" select="./@ime"></xsl:variable>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
                <xsl:attribute name="type">croala</xsl:attribute>
                <xsl:attribute name="target"><xsl:value-of select="key('viafkey',$imeautora,$ime)/../@xml:id"/></xsl:attribute>
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

