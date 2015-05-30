<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- insert croala repo into sourceDesc -->
    <xsl:include href="copy.xsl"/>
    <xsl:template match="//tei:teiHeader/tei:fileDesc/tei:sourceDesc">
        <xsl:copy>
        <xsl:element name="bibl" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="type" xmlns:tei="http://www.tei-c.org/ns/1.0">repo</xsl:attribute>
            <xsl:attribute name="ana" xmlns:tei="http://www.tei-c.org/ns/1.0">digital</xsl:attribute>
            <xsl:text>Digitalna verzija: CroALa</xsl:text>
        </xsl:element>
            <xsl:call-template name="copy-children"/>
        </xsl:copy>
    </xsl:template> 
    
    <xsl:template match="//tei:teiHeader/tei:profileDesc">
        <xsl:copy>
            <xsl:element name="abstract" namespace="http://www.tei-c.org/ns/1.0">
            </xsl:element>
            <xsl:element name="settingDesc" namespace="http://www.tei-c.org/ns/1.0">
            </xsl:element>
            <xsl:element name="particDesc" namespace="http://www.tei-c.org/ns/1.0">
            </xsl:element>
            <xsl:element name="langUsage" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="language" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="ident" xmlns:tei="http://www.tei-c.org/ns/1.0">lat</xsl:attribute>
                    <xsl:attribute name="xml:lang" xmlns:tei="http://www.tei-c.org/ns/1.0">hrv</xsl:attribute>
                    <xsl:text>latinski</xsl:text>
                </xsl:element>
            </xsl:element>
            <xsl:call-template name="copy-children"/>
        </xsl:copy>
    </xsl:template> 
     
    <xsl:template name="copy-children">
        <xsl:copy-of select="./*"/>
    </xsl:template>
</xsl:stylesheet>

