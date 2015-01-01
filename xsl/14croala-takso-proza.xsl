<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 13croala-takso-proza.xsl add occupation element for prose works -->
    <!-- Jovanovic, started working on it 1/02/14 -->
        <!-- includes XSLT Template to copy anything, faster -->
        <!-- source: tei wiki and http://www.xmlplease.com/xsltidentity (nice examples!) -->
    <xsl:template match="comment()|processing-instruction()|text()">
        <xsl:copy/>
    </xsl:template>
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//tei:person">
        <xsl:choose>
            <xsl:when test="tei:occupation[contains(string-join(text(), ' '), 'proza')]">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
                    <xsl:element name="occupation" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute name="scheme">genera</xsl:attribute><xsl:attribute name="code">tax.prosa</xsl:attribute></xsl:element>
                </xsl:copy>

            </xsl:when>
            <xsl:when test="tei:occupation[contains(string-join(text(), ' '), 'poezij') or contains(string-join(text(), ' '), 'stihov')]">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
                    <xsl:element name="occupation" namespace="http://www.tei-c.org/ns/1.0"><xsl:attribute name="scheme">genera</xsl:attribute><xsl:attribute name="code">tax.poesis</xsl:attribute></xsl:element>
                </xsl:copy>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    </xsl:stylesheet>

