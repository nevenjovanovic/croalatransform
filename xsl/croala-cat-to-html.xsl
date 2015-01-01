<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">

        <xsl:output method="xml" indent="yes"/>
        <xsl:strip-space elements="*"/>
    <!-- croala-cat-to-html, transforms categories to a html list -->

        <xsl:template match="//tei:category[contains(@xml:id, 'gen.b2')]">
            <xsl:element name="tr">
                <xsl:element name="td">
                <xsl:value-of select="@xml:id"/>
            </xsl:element>
            <xsl:element name="td">
                <xsl:value-of select="tei:catDesc[@xml:id]"/>
                <xsl:if test="tei:catDesc[@sameAs]">
                    <xsl:text> (</xsl:text><xsl:value-of select="lower-case(string-join(tei:catDesc[@sameAs], ', '))"/><xsl:text>) </xsl:text>
                </xsl:if>
            </xsl:element>
            </xsl:element>
        </xsl:template>
    
    
    

    
    <xsl:template match="//tei:category[contains(@xml:id, 'gen.d')]">
        <xsl:element name="tr">
            <xsl:element name="td">
                <xsl:value-of select="@xml:id"/>
            </xsl:element>
            <xsl:element name="td">
                <xsl:value-of select="tei:catDesc[@xml:id]"/>
                <xsl:if test="tei:catDesc[@sameAs]">
                    <xsl:text> (</xsl:text><xsl:value-of select="lower-case(string-join(tei:catDesc[@sameAs], ', '))"/><xsl:text>) </xsl:text>
                </xsl:if>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:taxonomy[@xml:id='classstatus']/tei:category">
        <xsl:element name="tr">
            <xsl:element name="td">
                <xsl:value-of select="@xml:id"/>
            </xsl:element>
            <xsl:element name="td">
                <xsl:value-of select="tei:catDesc"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
        
    <xsl:template match="text()" />
</xsl:stylesheet>