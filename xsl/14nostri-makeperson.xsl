<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14nostri-makeperson.xsl prepare to include in TEI prosopography -->
    <!-- Jovanovic, started working on it 22/01/14 -->
    
    <!-- source: <author type="croala" ime="Aegidii, Guillermus" target="xxx001" /> -->
    <!-- wanted: <person xml:id="xxx001"><persName xml:lang="hrv">... -->
    

    
    <xsl:template match="//author">
        <xsl:element name="person">
            <xsl:attribute name="xml:id"><xsl:value-of select="@target"/></xsl:attribute>
            <xsl:attribute name="type">juric</xsl:attribute>
            <xsl:element name="persName">
                <xsl:attribute name="xml:id">hrv</xsl:attribute>
                <xsl:value-of select="@ime"></xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    </xsl:stylesheet>

