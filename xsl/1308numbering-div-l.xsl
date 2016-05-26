<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- copy everything, number only the l elements, consecutively in each div -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:text/tei:front/tei:div/tei:l">
        <xsl:element name="{local-name()}" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="n" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="count(preceding-sibling::tei:l) + 1"/></xsl:attribute> 
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//tei:text/tei:body/tei:div/tei:l">
        <xsl:element name="{local-name()}" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="n" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="count(preceding-sibling::tei:l) + 1"/></xsl:attribute> 
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="//tei:body//tei:div/tei:div[tei:l]/tei:l">
             
             <xsl:element name="{local-name()}" namespace="http://www.tei-c.org/ns/1.0">
                 
                 <!-- <xsl:attribute name="n" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:number level="single" count="tei:l" format="1"/></xsl:attribute> -->
<xsl:attribute name="n" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:number level="multiple" count="tei:div[tei:div]|tei:div[tei:l]|tei:div[tei:l]/tei:l" format="1.1"/></xsl:attribute>
                 <xsl:apply-templates/>
             </xsl:element>
    </xsl:template> 
    <!-- count elements in lg, continue from previous numbers -->
    <!-- to be solved: numbering of l[preceding-sibling::lg] -->
    <xsl:template match="//tei:body//tei:div[tei:l]/tei:lg/tei:l">
        <xsl:variable name="num">
            <xsl:value-of select="count(preceding::tei:l) - count(preceding::tei:div//tei:l)"/>
        </xsl:variable>
        <xsl:element name="{local-name()}" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="n" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:number count="tei:div[tei:l]" level="single" format="1."/><xsl:number value="($num + 1)" format="1.1"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
</xsl:stylesheet>

