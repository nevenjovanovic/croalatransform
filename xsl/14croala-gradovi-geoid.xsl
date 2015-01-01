<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14croala-gradovi-geoid.xsl add geonames/cerl IDs as @target in ref elements to pubPlaces -->
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
    
    <xsl:variable name="ime" select="document('/home/neven/rad/croala-r/biblio/cerl-juric-ids.xml')/r"/>
    
    <xsl:key name="viafkey" match="lemma" use="w"/>
    
    
    
    <xsl:template match="//tei:body//tei:pubPlace[not(tei:note) and not(tei:add)]">
        <!-- get something to compare: -->
        <xsl:variable name="imeautora" select="text()[1]"></xsl:variable>
        <xsl:copy>
            <xsl:if test="key('viafkey',normalize-space($imeautora),$ime)/l[1] != ''">
                <xsl:attribute name="ref"><xsl:value-of select="key('viafkey',normalize-space($imeautora),$ime)/l[1]"/></xsl:attribute>
              
            </xsl:if>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>      
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//tei:body//tei:pubPlace[not(tei:note) and tei:add]">
        <!-- get something to compare: -->
        <xsl:variable name="imeautora" select="tei:add[1]/text()[1]"></xsl:variable>
        <xsl:copy>
            <xsl:if test="key('viafkey',normalize-space($imeautora),$ime)/l[1] != ''">
                <xsl:attribute name="ref"><xsl:value-of select="key('viafkey',normalize-space($imeautora),$ime)/l[1]"/></xsl:attribute>
                
            </xsl:if>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>      
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

