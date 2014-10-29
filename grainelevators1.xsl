<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:output method="xml"/>
   <xsl:template match="/">
        <PrintSpace>
   <xsl:for-each select="//PrintSpace/TextBlock">
            <xsl:sort select="count(TextLine)" data-type="number" order="descending"/>
              
                <xsl:copy-of select="."/> 
        </xsl:for-each>
        </PrintSpace>  
    </xsl:template>    
    
</xsl:stylesheet>