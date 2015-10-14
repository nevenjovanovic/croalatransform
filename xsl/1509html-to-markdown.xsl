<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:functx="http://www.functx.com"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    version="2.0">
    
  <xsl:output method="xml" indent="no" omit-xml-declaration="yes" />
  <xsl:strip-space elements="*" />
<!-- html-to-markdown: convert select elements under //text to markdown notation  -->
<!-- produce table of contents if div[2] -->
<!-- based on https://gist.github.com/gabetax/1702774  -->
  
  <!-- Required for li indenting -->
  <xsl:function name="functx:repeat-string" as="xs:string">
    <xsl:param name="stringToRepeat" as="xs:string?"/> 
    <xsl:param name="count" as="xs:integer"/> 
    <xsl:sequence select="string-join((for $i in 1 to $count return $stringToRepeat), '')"/>
  </xsl:function>
  <xsl:template match="//tei:teiHeader"><xsl:text>---
layout: page
title: </xsl:text><xsl:value-of select="normalize-space(//tei:titleStmt/tei:title)"/><xsl:text>
author: Scripsit </xsl:text><xsl:value-of select="normalize-space(//tei:titleStmt/tei:author/tei:name)"/><xsl:text>
date: </xsl:text><xsl:value-of select="normalize-space(//tei:profileDesc/tei:creation/tei:date)"/><xsl:text>
editor: Edidit </xsl:text><xsl:value-of select="normalize-space(//tei:titleStmt/tei:editor/tei:name)"/><xsl:text>, </xsl:text><xsl:value-of select="normalize-space(//tei:editionStmt/tei:edition/tei:date)"/><xsl:text>
---&#xa;&#xa;</xsl:text></xsl:template>
  <xsl:template match="//tei:text">
    <xsl:apply-templates select="*" />
  </xsl:template>

  <xsl:template match="li">
    <xsl:value-of select="functx:repeat-string('    ', count(ancestor::li))"/>
    <xsl:choose>
      <xsl:when test="name(..) = 'ol'">
        <xsl:value-of select="position()" />
        <xsl:text>. </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>* </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="normalize-space(text())" />
    <xsl:apply-templates select="* except (ul|ol)" />
    <xsl:text>&#xa;&#xa;</xsl:text>
    <xsl:apply-templates select="ul|ol" />
  </xsl:template>

  <!-- Don't process text() nodes for these - prevents unnecessary whitespace -->
  <xsl:template match="ul|ol">
    <xsl:apply-templates select="* except text()" />
  </xsl:template>

  <xsl:template match="a">
    <xsl:text>[</xsl:text>
    <xsl:apply-templates select="node()|text()" />
    <xsl:text>](</xsl:text>
    <xsl:value-of select="@href" />
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="img">
    <xsl:text>![</xsl:text>
    <xsl:value-of select="@alt" />
    <xsl:text>](</xsl:text>
    <xsl:value-of select="@src" />
    <xsl:text>)</xsl:text>
  </xsl:template>


  <xsl:template match="strong|b">
    <xsl:text>**</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>**</xsl:text>
  </xsl:template>
  <xsl:template match="em|i">
    <xsl:text>*</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>*</xsl:text>
  </xsl:template>
  <xsl:template match="code">
    <!-- todo: skip the ` if inside a pre -->
    <xsl:text>`</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>`</xsl:text>
  </xsl:template>

  <xsl:template match="br">
    <xsl:text>  &#xa;</xsl:text>
  </xsl:template>
  
  <!-- Block elements -->
  <xsl:template match="hr">
    <xsl:text>----&#xa;&#xa;</xsl:text>
  </xsl:template>
  
  <!-- add tei prefix, closer as block -->
  <xsl:template match="tei:p|tei:div|tei:closer"><xsl:text>
  </xsl:text><xsl:apply-templates select="*|text()" />
    <xsl:text>&#xa;&#xa;</xsl:text> <!-- Block element -->
  </xsl:template>
  
  <xsl:template match="*[matches(name(), 'h[1-6]')]">
    <xsl:value-of select="functx:repeat-string('#', xs:integer(substring(name(), 2)))" />
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="*|text()" />
    <xsl:text>&#xa;&#xa;</xsl:text> <!-- Block element -->
  </xsl:template>
  
  <xsl:template match="tei:body[tei:div[2]]">
<xsl:text># Tabula
</xsl:text><xsl:for-each select="tei:div">
  <xsl:text>1. [</xsl:text><xsl:value-of select="normalize-space(tei:head)"/><xsl:text>](#</xsl:text><xsl:value-of select="replace(normalize-space(tei:head), '\s', '-')"/><xsl:text>)
</xsl:text></xsl:for-each><xsl:text>
---</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  
  <!-- head = h2 -->
  <xsl:template match="tei:head"><xsl:element name="div"><xsl:attribute name="id"><xsl:value-of select="replace(normalize-space(string-join(text(), ' ')), ' ', '-')" /></xsl:attribute></xsl:element><xsl:text>&#xa;&#xa;## </xsl:text><xsl:value-of select="normalize-space(string-join(text(), ' '))" /><xsl:text>
  
 </xsl:text> <!-- Block element -->
  </xsl:template>
  
  <!-- line of verse ends in br -->
  <xsl:template match="tei:l[not(parent::tei:lg)]">
    <xsl:value-of select="normalize-space(string-join((text()|descendant::text()[not(parent::tei:sic|parent::tei:note)]), ' '))" />
    <xsl:if test="(tei:note)"><xsl:text>{% marginnote '</xsl:text><xsl:value-of select="normalize-space(tei:note)"/><xsl:text>' %}</xsl:text>
    </xsl:if><xsl:if test="(tei:choice/tei:sic)"><xsl:text>{% marginnote '</xsl:text><xsl:value-of select="normalize-space(tei:choice/tei:sic)"/><xsl:text> MS' %}</xsl:text>
    </xsl:if><xsl:text>  &#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:note[not(parent::tei:l)]"><xsl:text>{% marginnote '</xsl:text><xsl:value-of select="normalize-space(text())"/><xsl:text>' %}</xsl:text></xsl:template>
  
  <xsl:template match="tei:l[parent::tei:lg]">
    <xsl:choose>
      <xsl:when test=".[not(preceding-sibling::tei:l)]"><xsl:text>&#xa;&#xa;</xsl:text><xsl:value-of select="normalize-space(string-join(text(), ' '))" />
        <xsl:if test="tei:note"><xsl:text>{% marginnote '</xsl:text><xsl:value-of select="normalize-space(tei:note)"/><xsl:text>' %}</xsl:text>
        </xsl:if><xsl:text>  &#xa;</xsl:text></xsl:when>
      <xsl:when test=".[not(following-sibling::tei:l)]"><xsl:value-of select="normalize-space(string-join(text(), ' '))" />
        <xsl:if test="tei:note"><xsl:text>{% marginnote '</xsl:text><xsl:value-of select="normalize-space(tei:note)"/><xsl:text>' %}</xsl:text>
        </xsl:if><xsl:text>  &#xa;&#xa;&#xa;</xsl:text></xsl:when>
      <xsl:otherwise>
    <xsl:value-of select="normalize-space(string-join(text(), ' '))" />
    <xsl:if test="tei:note"><xsl:text>{% marginnote '</xsl:text><xsl:value-of select="normalize-space(tei:note)"/><xsl:text>' %}</xsl:text>
    </xsl:if><xsl:text>  &#xa;</xsl:text>
      </xsl:otherwise>
      </xsl:choose>
  </xsl:template>
  
  <xsl:template match="pre">
    <xsl:text>    </xsl:text>
    <xsl:value-of select="replace(text(), '&#xa;', '&#xa;    ')" />
    <xsl:text>&#xa;&#xa;</xsl:text> <!-- Block element -->
  </xsl:template>
  
  <xsl:template match="blockquote">
    <xsl:text>&gt;   </xsl:text>
    <xsl:value-of select="replace(text(), '&#xa;', '&#xa;&gt; ')" />
    <xsl:text>&#xa;&#xa;</xsl:text> <!-- Block element -->
  </xsl:template>
</xsl:stylesheet>