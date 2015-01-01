<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">

        <xsl:output method="xml" indent="yes"/>
        <xsl:strip-space elements="*"/>

        <xsl:variable name="collection">
            <xsl:copy-of select="collection('file:///home/neven/rad/croala-r/basex?strip-space=yes;select=banic-j-epist-1513*.xml')/*"/>
        </xsl:variable>
        
        <xsl:template match="@*|node()">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:template>
        
        <xsl:template match="/">
            <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:apply-templates select="($collection//tei:text/tei:body/tei:div)"/>
            </xsl:element>
            </xsl:element>
        </xsl:template>
        
    
</xsl:stylesheet>