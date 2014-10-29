<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
<xsl:output method="text" encoding="UTF-8"/>
<xsl:strip-space elements="*" />
<xsl:variable name="line" select="'&#x0a;'"/>

<xsl:param name="province"/>
<xsl:param name="railway"/>
<xsl:param name="item"/>

<xsl:template match="/">
    
    <xsl:apply-templates/>
    
</xsl:template>



<xsl:template match="station">
    <xsl:value-of select="concat($item, ',', $province, ',', $railway, ',')"/>
    <xsl:apply-templates select="*|@*"/>
</xsl:template>

<xsl:template match="name">
    <xsl:value-of select="concat(normalize-space(.),',')"/>   
</xsl:template>
   
<xsl:template match="owner">
    <xsl:value-of select="concat(translate(normalize-space(.), '.', ''), ',')"/>
</xsl:template>

<xsl:template match="type">
    <xsl:value-of select="concat(normalize-space(.), ',')"/>
</xsl:template>

<xsl:template match="capacity">
    <xsl:value-of select="normalize-space(.)"/>
    <xsl:value-of select="$line"/>
</xsl:template>
    
</xsl:stylesheet>