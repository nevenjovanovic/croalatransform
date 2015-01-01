<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14croala-prosop-semium.xsl add @period attr to date element with thirds of centuries -->
    <!-- Jovanovic, 3/02/14 -->
    <!-- from / to nije riješeno -->
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
    <xsl:variable name="firstthird" select="'(0[1-9]|[1-2][0-9]|3[0-3])'"/>
    <xsl:variable name="secondthird" select="'([4-5][0-9]|3[4-9]|6[0-6])'"/>
    <!-- declare variables for semium address -->
    <xsl:variable name="semiumaddr" select="'http://semium.org/time/'"/>
    <xsl:variable name="semiumfrst" select="'xx_1_third'"/>
    <xsl:variable name="semiumscnd" select="'xx_2_third'"/>
    <xsl:variable name="semiumthrd" select="'xx_3_third'"/>
    
    <!-- 11th century: -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('10',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'10',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('10',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'10',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^10[7-9]|^106[7-9]|^1100')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'10',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 12th century: -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('11',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'11',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('11',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'11',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^11[7-9]|^116[7-9]|^1200')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'11',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 13th century: -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('12',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'12',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('12',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'12',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^12[7-9]|^126[7-9]|^1300')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'12',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 14th century: -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('13',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'13',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('13',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'13',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^13[7-9]|^136[7-9]|^1400')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'13',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
   <!-- 15th century: -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('14',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'14',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('14',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'14',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^14[7-9]|^146[7-9]|^1500')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'14',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 16th century: -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('15',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'15',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('15',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'15',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '15[7-9]|156[7-9]|1600')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'15',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 17th century -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('16',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'16',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('16',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'16',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^16[7-9]|^166[7-9]|^1700')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'16',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <!-- 18th century -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('17',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'17',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('17',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'17',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^17[7-9]|176[7-9]|^1800')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'17',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- 19th century -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('18',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'18',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('18',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'18',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^18[7-9][0-9]|186[7-9]|^1900')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'18',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 20th century -->
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('19',$firstthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'19',$semiumfrst)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., concat('19',$secondthird))]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'19',$semiumscnd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//tei:date[(@when, @notBefore, @notAfter, @from, @to)[last()][matches(., '^19[7-9][0-9]|196[7-9]|^2000')]]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="period"><xsl:value-of select="concat($semiumaddr,'19',$semiumthrd)"/></xsl:attribute>
            <xsl:apply-templates select="comment()|processing-instruction()|text()|*"/>
        </xsl:copy>
    </xsl:template>
    
    
        </xsl:stylesheet>

