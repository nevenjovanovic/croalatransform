<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 1510croala-name-persName: copy everything, unify persName treatment in teiHeader: -->
    <!-- note/@place='foot' , ref, num -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:teiHeader//tei:name[ancestor::tei:titleStmt or ancestor::tei:revisionDesc]">
        <persName>
            <xsl:apply-templates select="@*|node()"/>
        </persName>
    </xsl:template>
</xsl:stylesheet>

