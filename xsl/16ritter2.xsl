<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 16ritter2: copy everything, transform p into l -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:head/tei:hi">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
</xsl:stylesheet>

