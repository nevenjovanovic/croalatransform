<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- 14zefania-to-tei.xsl transform Zefania Bible book to TEI -->
    <!-- Jovanovic, started working on it 20/07/14 -->
        <!-- includes XSLT Template to copy anything, faster -->
        <!-- source: tei wiki and http://www.xmlplease.com/xsltidentity (nice examples!) -->
    
    <xsl:template match="//XMLBIBLE">
        <xsl:element name="TEI" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:element name="teiHeader" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="fileDesc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="titleStmt" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="title" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./INFORMATION/title"></xsl:value-of></xsl:element>
                    </xsl:element>
                    <xsl:element name="editionStmt" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="edition" namespace="http://www.tei-c.org/ns/1.0">TEI digitalno izdanje, XML prema HTML-u HBK (http://www.hbk.hr/biblija).</xsl:element>
                    </xsl:element>
                    <xsl:element name="publicationStmt" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./INFORMATION/contributors[2]"></xsl:value-of></xsl:element>
                    </xsl:element>
                    <xsl:element name="sourceDesc" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="bibl" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./INFORMATION/description"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="revisionDesc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="change" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="name" namespace="http://www.tei-c.org/ns/1.0">Neven Jovanović</xsl:element>
                        <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">2014-07-22</xsl:element>
                        Početak rada
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:for-each select="./BIBLEBOOK">
                        <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="n"><xsl:value-of select="./@bnumber"></xsl:value-of></xsl:attribute>
                            <xsl:attribute name="ana"><xsl:value-of select="./@bsname"></xsl:value-of></xsl:attribute>
                            <xsl:attribute name="type">book</xsl:attribute>
                            <xsl:for-each select="./CHAPTER">
                                <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="n"><xsl:value-of select="./@cnumber"></xsl:value-of></xsl:attribute>
                                    <xsl:attribute name="type">chapter</xsl:attribute>
                                    <xsl:for-each select="./VERS">
                                        <xsl:element name="ab" namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:attribute name="n"><xsl:value-of select="./@vnumber"></xsl:value-of></xsl:attribute>
                                            <xsl:value-of select="./text()"></xsl:value-of>
                                        </xsl:element>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>

        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//BIBLEBOOK">
            
                

        
        
    </xsl:template>
    <xsl:template match="//CHAPTER">
        
    </xsl:template>
    <xsl:template match="//VERS">
        
    </xsl:template>
    </xsl:stylesheet>

