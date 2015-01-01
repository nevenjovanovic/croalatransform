<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "text" indent="yes" omit-xml-declaration="no" /> 
    <!-- 14ghlh-seg-to-file: output each seg as a text file, named from @corresp  -->
    <xsl:strip-space elements="tei:seg"/>
    
    <xsl:template match="//*:body//*:p[*:seg]|*:div[*:seg]">
        <xsl:for-each select="*:seg">
            <xsl:result-document href="file:/home/neven/rad/hrvprijev/ghlh/rad/{replace(@corresp, 'grc', 'hrv')}.txt" method="text">
        <xsl:value-of select="normalize-space(string-join(text(), ' '))"/><xsl:text>

</xsl:text>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template> 
    <xsl:template match="//text()"/>
</xsl:stylesheet>

