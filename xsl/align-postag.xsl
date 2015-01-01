<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:aligned-text="http://alpheios.net/namespaces/aligned-text"
    xmlns:treebank="http://nlp.perseus.tufts.edu/syntax/treebank/1.5"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- align-postag: add Perseus postags to aligned document -->
    <xsl:include href="copy.xsl"/>
    <xsl:include href="/home/neven/rad/perseidstb/perseids_treebanking/transformations/morph-to-codes.xsl"/>
    <xsl:param name="e_lang" select="'lat'"/>
    <xsl:param name="e_morphQueryUrl" select="'http://services.perseids.org/bsp/morphologyservice/analysis/word?lang=REPLACE_LANG&amp;word=REPLACE_WORD&amp;engine=morpheusREPLACE_LANG'"/>
    
    <xsl:param name="e_includeExtras" select="true()"/>
    
    <xsl:variable name="nontext">
        <nontext xml:lang="grc"> “”—&quot;‘’,.:;&#x0387;&#x00B7;?!\[\]\{\}\-</nontext>
        <nontext xml:lang="greek"> “”—&quot;‘’,.:;&#x0387;&#x00B7;?!\[\]\{\}\-</nontext>
        <nontext xml:lang="ara"> “”—&quot;‘’,.:;?!\[\]\{\}\-&#x060C;&#x060D;</nontext>
        <nontext xml:lang="lat"> “”—&quot;‘’,.:;&#x0387;&#x00B7;?!\[\]()\{\}\-</nontext>
        <nontext xml:lang="*"> “”—&quot;‘’,.:;&#x0387;&#x00B7;?!\[\]()\{\}\-</nontext>
    </xsl:variable>
    
    <xsl:template match="//aligned-text:wds[@lnum='L2']/aligned-text:w/aligned-text:text">
        <xsl:variable name="match-nontext">
            <xsl:choose>
                <xsl:when test="$e_lang and $nontext/nontext[@xml:lang=$e_lang]">
                    <xsl:value-of select="$nontext/nontext[@xml:lang=$e_lang]"/>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="$nontext/nontext[@xml:lang='*']"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="match_string" select="concat('^[', $match-nontext, ']$')"/>
        <xsl:variable name="punc">
            <xsl:analyze-string select="text()" regex="{$match_string}">
                <xsl:matching-substring><match/></xsl:matching-substring>
                <xsl:non-matching-substring/>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$punc/match">
                <xsl:element name="word" xmlns="http://nlp.perseus.tufts.edu/syntax/treebank/1.5">
                    <xsl:attribute name="lemma" select="'punc1'"/>
                    <xsl:attribute name="postag" select="'u--------'"/>
                </xsl:element>
                
                <xsl:element name="text" xmlns="http://alpheios.net/namespaces/aligned-text">
                    <xsl:value-of select="text()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="qstring" select="translate(text(),'áàâäéèêëíìîïóòôöúùûü&#xA; ','aaaaeeeeiiiioooouuuu')"></xsl:variable>
                <xsl:variable name="url" select="replace(replace($e_morphQueryUrl,'REPLACE_LANG',$e_lang),'REPLACE_WORD',$qstring)"/>
                <xsl:variable name="results" select="doc($url)"/>
                <xsl:variable name="parsed">
                    <xsl:apply-templates select="$results//entry"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$parsed//morph">
                        <xsl:variable name="first_parse">
                            <!-- insert an element from treebank dtd -->
                            <xsl:element  name="word"  namespace="http://nlp.perseus.tufts.edu/syntax/treebank/1.5">
                                <xsl:attribute name="lemma" select="(($parsed//morph)[1]/hdwd)[1]"/>
                                <xsl:attribute name="form"><xsl:value-of select="text()"/></xsl:attribute>
                                <xsl:attribute name="postag" select="(($parsed//morph)[1]/code)[1]"/>
                            </xsl:element>
                            <xsl:element name="text" xmlns="http://alpheios.net/namespaces/aligned-text">
                                <xsl:value-of select="text()"/>
                            </xsl:element>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$e_includeExtras">
                                <xsl:element  name="word"  namespace="http://nlp.perseus.tufts.edu/syntax/treebank/1.5">
                                    <xsl:copy-of select="$first_parse/word/@*"/>
                                    <xsl:for-each select="$parsed//morph">
                                        <xsl:variable name="parsenum" select="position()"/>
                                        <xsl:for-each select="hdwd">
                                            <xsl:variable name="index" select="position()"/>
                                            <xsl:variable name="nval">
                                                <xsl:choose>
                                                    <xsl:when test="$index &gt; 1"><xsl:value-of select="concat($parsenum,'.',$index)"/></xsl:when>
                                                    <xsl:otherwise><xsl:value-of select="$parsenum"/></xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:element name="alt" xmlns="http://nlp.perseus.tufts.edu/syntax/treebank/1.5">
                                                <xsl:attribute name="n"><xsl:value-of select="$nval"/></xsl:attribute>
                                                <xsl:copy-of select="$first_parse/word/@*[not(name() = 'lemma') and not(name() = 'postag') and not(name() = 'id')]"/>
                                                <xsl:attribute name="lemma" select="."/>
                                                <xsl:attribute name="postag" select="(../code)[$index]"/>
                                                <xsl:copy-of select="(../extras)[$index]/@*"/>
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                    <xsl:element name="text" xmlns="http://alpheios.net/namespaces/aligned-text">
                                        <xsl:value-of select="text()"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="$first_parse"></xsl:copy-of>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="word" xmlns="http://nlp.perseus.tufts.edu/syntax/treebank/1.5">
                            <xsl:attribute name="lemma">NA</xsl:attribute>
                            <xsl:attribute name="form"><xsl:value-of select="$qstring"/></xsl:attribute>
                        </xsl:element>
                        <xsl:element name="text" xmlns="http://alpheios.net/namespaces/aligned-text">
                            <xsl:value-of select="translate(text(),'&#xA; ','')"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>

