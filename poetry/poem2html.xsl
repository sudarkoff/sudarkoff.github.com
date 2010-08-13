<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/album">
    <html>
      <head>
        <title>Sudarkoff.com - Poetry</title>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="author">
    <h1 style="color:darkgray"><xsl:value-of select="@name"/></h1>
    <xsl:apply-templates/>
    <hr/>
  </xsl:template>

  <xsl:template match="verse">
    <h3><xsl:value-of select="title"/></h3>
    <i><xsl:value-of select="date"/></i>
    <pre>
      <xsl:value-of select="text"/>
    </pre>
  </xsl:template>

</xsl:stylesheet>
