<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0">
  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/">
    <xsl:value-of select="//yweather:condition/@code"/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
