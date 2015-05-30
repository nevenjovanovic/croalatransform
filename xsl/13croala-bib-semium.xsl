<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 13croala-bib-semium.xsl add @period attr to date element with thirds of centuries -->
    <!-- Jovanovic, started working on it 07/01/14 -->
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
    <!-- match year in date, add @period attribute with Semium value -->
    
    <!-- declare variables for thirds of century -->
    <xsl:variable name="firstthird" select="'(0[1-9]|[1-2][0-9]|3[1-3])'"/>
    <xsl:variable name="secondthird" select="'([4-5][0-9]|3[4-9]|6[0-6])'"/>
    <!-- declare variables for semium address -->
    <xsl:variable name="semiumaddr" select="'http://semium.org/time/'"/>
    <xsl:variable name="semiumfrst" select="'xx_1_third'"/>
    <xsl:variable name="semiumscnd" select="'xx_2_third'"/>
    <xsl:variable name="semiumthrd" select="'xx_3_third'"/>
    
    <xsl:template match="//tei:date[not(@period) and @*[starts-with(.,'10')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period">10xx</xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <!-- 15th century: -->
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^14',$firstthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('14',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^14',$secondthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('14',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., '^14[7-9][0-9]|^146[7-9]|^1500')][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('14',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 16th century: -->
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^15',$firstthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('15',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^15',$secondthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('15',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., '^15[7-9][0-9]|156[7-9]|^1600')][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('15',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 17th century -->
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^16',$firstthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('16',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^16',$secondthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('16',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., '^16[7-9][0-9]|166[7-9]|^1700')][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('16',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <!-- 18th century -->
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^17',$firstthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('17',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^17',$secondthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('17',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., '^17[7-9][0-9]|^176[7-9]|^1800')][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('17',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- 19th century -->
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^18',$firstthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('18',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^18',$secondthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('18',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., '(^18[7-9][0-9]|^186[7-9]|^1900)')][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('18',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <!-- 20th century -->
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^19',$firstthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('19',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^19',$secondthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('19',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., '(^19[7-9][0-9]|^196[7-9]|^2000)')][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('19',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <!-- 21th century -->
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^20',$firstthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('20',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., concat('^20',$secondthird))][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('20',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[not(@period) and @*[matches(., '(^20[7-9][0-9]|^206[7-9]|^2100)')][1]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat('20',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    </xsl:stylesheet>

