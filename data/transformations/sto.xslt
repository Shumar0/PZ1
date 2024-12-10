<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <title>Clients of the Service Station</title>
      </head>
      <body>
        <h1>List of Clients</h1>
        <ul>
          <xsl:for-each select="ServiceStation/Clients/Client">
            <li>
              <xsl:value-of select="Name"/>
              (<xsl:value-of select="ContactInformation/Phone"/>)
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
