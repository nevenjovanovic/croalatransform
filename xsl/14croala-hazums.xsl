<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14nostri-makeperson.xsl prepare to include in TEI prosopography -->
    <!-- Jovanovic, started working on it 22/01/14 -->
    
    <xsl:template match="*[normalize-space()='']|@*[normalize-space()='']" />
    <xsl:template match="text()" />
    
    <xsl:template match="//*:row">
        <xsl:element name="msDesc">
            <xsl:attribute name="xml:id"><xsl:value-of select="concat('hr-zg-hazu',generate-id())"/></xsl:attribute>
            <xsl:element name="msIdentifier">
                <xsl:element name="placeName">Zagreb</xsl:element>
                <xsl:element name="institution">Arhiv HAZU</xsl:element>
                <xsl:element name="idno"><xsl:value-of select="*:cell[1]"/></xsl:element>
            </xsl:element>
            <xsl:element name="msContents">
            <xsl:element name="msItem">
                <xsl:element name="title"><xsl:value-of select="*:cell[2]"/></xsl:element>
                <xsl:element name="author"><xsl:value-of select="*:cell[4]"/></xsl:element>
                <xsl:element name="note"><xsl:value-of select="*:cell[6]"/></xsl:element>
                <xsl:element name="note">
                    <xsl:attribute name="ana">žanr</xsl:attribute>
                    <xsl:value-of select="*:cell[7]"/></xsl:element>
                <xsl:element name="note">
                    <xsl:attribute name="ana">ekscerpirao</xsl:attribute>
                    <xsl:value-of select="*:cell[8]"/></xsl:element>
                <xsl:element name="note">
                    <xsl:attribute name="ana">razno</xsl:attribute>
                    <xsl:value-of select="*:cell[9]"/></xsl:element>
            </xsl:element>
            </xsl:element>
            <xsl:element name="physDesc">
                <xsl:element name="p"><xsl:value-of select="*:cell[3]"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="history">
                <xsl:element name="origin">
                    <xsl:element name="origDate"><xsl:value-of select="*:cell[5]"/></xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:element>
        
    </xsl:template>
    </xsl:stylesheet>

