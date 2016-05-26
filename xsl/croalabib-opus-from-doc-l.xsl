<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="yes" /> 
    <!-- croalabib-opus-from-doc-l: use teiHeader etc. to produce a bibliographic record (work), for verse -->
    
    <xsl:template match="//text()"/>
    <xsl:template match="//tei:teiHeader">
            <bibl>
                <xsl:attribute name="xml:id"><xsl:value-of select="concat(tei:fileDesc/tei:titleStmt/tei:author/@ref,'-', generate-id())"/></xsl:attribute>
                <xsl:attribute name="type">opus</xsl:attribute>
                <xsl:element name="author">
                    <xsl:element name="ref">
                        <xsl:attribute name="target"><xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:author/@ref"/></xsl:attribute>
                    <xsl:copy-of select="tei:fileDesc/tei:titleStmt/tei:author/tei:persName[1]//text()"/>
                    </xsl:element>
                    </xsl:element>
                    <xsl:element name="title">
                        <xsl:copy-of select="replace(tei:fileDesc/tei:titleStmt/tei:title//text(), ', versio electronica', '')"></xsl:copy-of>
                    </xsl:element>
                <xsl:element name="title">
                    <xsl:attribute name="type">incipit</xsl:attribute>
                    <xsl:value-of select="../tei:text/tei:body/tei:div[1]/tei:l[1]"></xsl:value-of>
                </xsl:element>
                <xsl:element name="title">
                    <xsl:attribute name="type">explicit</xsl:attribute>
                    <xsl:value-of select="../tei:text/tei:body/tei:div[last()]/tei:l[last()]"></xsl:value-of>
                </xsl:element>
                <xsl:element name="date">
                    <xsl:copy-of select="tei:profileDesc/tei:creation/tei:date/@when"></xsl:copy-of>
                    <xsl:copy-of select="tei:profileDesc/tei:creation/tei:date/@period"></xsl:copy-of>
                    <xsl:value-of select="tei:profileDesc/tei:creation/tei:date/@when"/>
                </xsl:element>
                <xsl:copy-of select="tei:profileDesc/tei:creation/tei:placeName"/>
                <xsl:for-each select="tei:profileDesc/tei:textClass/tei:keywords[@scheme='typus']/tei:term">
                    <xsl:element name="note">
                        <xsl:attribute name="type">genus01.lat</xsl:attribute>
                        <xsl:attribute name="xml:lang">lat</xsl:attribute>
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="tei:profileDesc/tei:textClass/tei:keywords[@scheme='genre']/tei:term">
                    <xsl:element name="note">
                        <xsl:attribute name="type">genus</xsl:attribute>
                        <xsl:attribute name="xml:lang">lat</xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
                </xsl:for-each>
                <xsl:element name="relatedItem">
                    <xsl:attribute name="type">croala.digital</xsl:attribute>
                    <xsl:element name="ref">
                        <xsl:attribute name="type">croala</xsl:attribute>
                        <xsl:attribute name="target"><xsl:value-of select="tei:fileDesc/@xml:id"/></xsl:attribute>
                        <xsl:text>CroALa</xsl:text>
                    </xsl:element>
                </xsl:element>
            </bibl>
        </xsl:template>
</xsl:stylesheet>
