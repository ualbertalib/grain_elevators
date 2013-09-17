<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <!--xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:noNamespaceSchemaLocation="http://schema.ccs-gmbh.com/metae/alto-1-1.xsd" 
    xmlns:xlink="http://www.w3.org/TR/xlink" -->
    

<xsl:output method="xml" indent="yes" standalone="yes"/>

<xsl:template match="/">

    <xsl:variable name="line" select="'&#x0a;'"/>   
                    
                  <xsl:for-each select="alto/Layout/Page/PrintSpace/TextBlock[5]/TextLine">    
                      <xsl:variable name="hpos" select="number(@HPOS)"/>
                      <xsl:variable name="hpos1" select="@HPOS"/>
                      <xsl:variable name="pos" select="position()"/>                    
                      
                      <xsl:element name="station">
                      
                          <xsl:attribute name="name" >
                      
                        <xsl:choose>
                            
                          <xsl:when test="$hpos &lt; 250">   
                            <xsl:for-each select="String"> 
                            <xsl:choose>
                                <xsl:when test="number(@HPOS) &lt; 250">
                                    <xsl:value-of select="@CONTENT"/>
                                    
                                </xsl:when>
                            </xsl:choose>
                            </xsl:for-each>
                          </xsl:when>
                            
                          
                          
                          <xsl:when test="$hpos &gt; 250">
                          
                              <xsl:for-each select="//preceding::TextLine[@HPOS = $hpos1]/String"> 
                                  <xsl:choose>
                                      <xsl:when test="number(@HPOS) &lt; 250">
                                          <xsl:value-of select="@CONTENT"/>
                                      </xsl:when>
                                  </xsl:choose>
                              </xsl:for-each>
                          </xsl:when> 
                            
                            
                        </xsl:choose>    
                          </xsl:attribute>            
                      
                          <xsl:value-of select="$line"/>     
                      <owner>
                         <xsl:for-each select="String">    
                             
                             <xsl:choose>
                                <xsl:when test="number(@HPOS) &gt; 250 and number(@HPOS) &lt; 850">
                                    <xsl:value-of select="@CONTENT"/>
                                    <xsl:value-of select="' '"/>
                                </xsl:when>                       
                            </xsl:choose>
                             
                         </xsl:for-each>
                        
                      </owner>
                             
                             
                          <xsl:value-of select="$line"/>
                      <type>
                        <xsl:for-each select="String">         
                               
                            <xsl:choose>
                                <xsl:when test="translate(normalize-space(@CONTENT), ',.', '') = 'ME'">
                                    <xsl:value-of select="'M.E.'"/>
                                </xsl:when>                       
                                <xsl:when test="translate(normalize-space(@CONTENT), ',.', '') = 'E'">
                                    <xsl:value-of select="'E.'"/>
                                </xsl:when>
                            </xsl:choose> 
                        </xsl:for-each>    
                      </type>
                      
                    
                      <xsl:value-of select="$line"/>    
                      <capacity>
                          <xsl:variable name="capacity" select="(String/@CONTENT)[last()]"/>
                          <xsl:value-of select="translate(normalize-space($capacity), ',.', '')"/>
                      </capacity>
                      
                      
                      </xsl:element>
                          
                      
                      
                    <xsl:value-of select="$line"/>       
                  
                  </xsl:for-each>
          
        
        
    </xsl:template>
    
</xsl:stylesheet>

<!--/alto/Layout[1]/Page[1]/PrintSpace[1]/TextBlock[5]/TextLine[1]/String[1]/@HPOS-->