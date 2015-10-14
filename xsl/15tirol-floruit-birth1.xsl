<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- copy everything, rename first floruit to element birth -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//*:person/*:floruit[1][not(@when) and following-sibling::*:floruit[1]]">
        <xsl:element name="TEI:birth" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:value-of select="/tei:date"/> 
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
    
</xsl:stylesheet>

