<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 14tei-milestone-to-div: convert milestones to divs, according to CTS scheme of Perseus -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:milestone">
             
             <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
                 <xsl:attribute name="type" xmlns:tei="http://www.tei-c.org/ns/1.0">section</xsl:attribute>
                 <xsl:attribute name="n" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./@n"/></xsl:attribute>
                 <xsl:attribute name="corresp" xmlns:tei="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./@corresp"/></xsl:attribute>
                 <xsl:copy-of select="./following-sibling::tei:p[1]"/>
             </xsl:element><xsl:text>
             </xsl:text>
             
        
    </xsl:template> 
    <xsl:template match="//tei:body//tei:div/tei:p"/>
    
</xsl:stylesheet>

