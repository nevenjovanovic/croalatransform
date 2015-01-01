<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14nostri-makeid.xsl transform last name to id -->
    <!-- Jovanovic, started working on it 22/01/14 -->
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
    
    <!-- model: <author type="croala" ime="Aegidii, Guillermus" target="" /> -->
    

    
    <xsl:template match="//author">
        <xsl:variable name="autorovid" select="translate(lower-case(substring-before(@ime, ',')),'čćđšž- ','ccdsz')"></xsl:variable>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:choose><xsl:when test="@target!= '' ">
                <xsl:copy-of select="@target"/>
            </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="target"><xsl:value-of select="concat($autorovid,generate-id())"></xsl:value-of></xsl:attribute>

                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

