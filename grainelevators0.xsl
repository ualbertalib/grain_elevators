<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

<xsl:output method="text"/>

<xsl:template match="/">
    
    <xsl:choose>
        <xsl:when test="//PrintSpace/TextBlock[1]/TextLine[1]/String[1][@CONTENT ='LICENSED']">
        
        <xsl:variable name="province" select="//PrintSpace/TextBlock[1]/TextLine[3]/String[3]/@CONTENT"/>
        <xsl:variable name="railway">    
            <xsl:for-each select="//PrintSpace/TextBlock[1]/TextLine[last()]/String">
                <xsl:value-of select="@CONTENT"/>
                <xsl:value-of select="' '"/>
            </xsl:for-each>
        </xsl:variable>
            <xsl:value-of select="translate((concat($province, ',', normalize-space($railway))), '.', '')"/>
        </xsl:when>
    </xsl:choose>
    
</xsl:template>


</xsl:stylesheet>