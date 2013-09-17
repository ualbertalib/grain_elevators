<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

<xsl:output method="text"/>
<xsl:variable name="line" select="'&#x0a;'"/>       


    
    <xsl:template match="list">

        <xsl:for-each select="station">
            <xsl:choose>
                <xsl:when test="string-length(@name) &gt; 0">
                    <xsl:value-of select="@name"/>
                </xsl:when>
                <xsl:when test="string-length(@name) = 0">
                    <xsl:value-of select="preceding-sibling::station[@name != '']"/>   
                </xsl:when>
               
            </xsl:choose>
            
            <xsl:value-of select="','"/>
            <xsl:value-of select="owner"/>
            <xsl:value-of select="','"/>
            <xsl:value-of select="type"/>
            <xsl:value-of select="','"/>
            <xsl:value-of select="capacity"/>
            <xsl:value-of select="$line"/>
        </xsl:for-each>
        
        
    </xsl:template>

</xsl:stylesheet>