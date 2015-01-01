<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 14ghlh-milestones: add milestones before divs of Plato's Republic, remove divs  -->
    
    <xsl:include href="copy.xsl"/>
    
    <xsl:template match="//*:body//*:div[@type='section']">
        <xsl:element name="milestone">
            <xsl:attribute name="n" select="./@n"/>
        </xsl:element>
        <xsl:copy-of select=".//node()[parent::*:said or parent::*:p]"/>
    </xsl:template>
</xsl:stylesheet>

