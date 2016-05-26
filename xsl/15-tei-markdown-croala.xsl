<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <!-- 15-tei-markdown-croala: local modifications of TEI to markdown conversion, Neven Jovanović  -->
    <xsl:import href="file:/home/neven/Oxygen%20XML%20Editor%2017/frameworks/tei/xml/tei/stylesheet/markdown/tei-to-markdown.xsl"/>
    
    <xsl:template match="docTitle">
                <xsl:call-template name="newline"/>#<xsl:text> </xsl:text>
                <xsl:apply-templates/>
                <xsl:call-template name="newline"/>
    </xsl:template>
    
</xsl:stylesheet>