<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

<xsl:output method="xml"/>
<xsl:variable name="line" select="'&#x0a;'"/>       

    <xsl:template match="/">
    <xsl:value-of select="$line"/>
        <list>
           <xsl:apply-templates/>
       </list>
    </xsl:template>
    
        
            <xsl:template match="station">
                <station>
                <xsl:apply-templates select="@*|node()"/>
                </station>
            </xsl:template>   
        
   
    <xsl:template match="name">
        <xsl:choose>
            <xsl:when test=". != 'noname'">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:when test=". = 'noname'">
                <xsl:copy-of select="../preceding-sibling::station[1]/name"/>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template match="owner|type|capacity">
    <xsl:copy> 
    <xsl:value-of select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>