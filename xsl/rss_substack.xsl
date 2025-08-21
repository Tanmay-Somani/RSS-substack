<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:dc="http://purl.org/dc/elements/1.1/">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
<html>
<head>
  <meta charset="UTF-8"/>
  <title><xsl:value-of select="rss/channel/title"/></title>
  <style>
    body { font-family: Arial, sans-serif; background: var(--bg); color: var(--fg); margin: 20px; }
    a { color: var(--link); }
    .item { padding: 1em; margin: 1em 0; border-radius: 8px; background: var(--card-bg); }
    img { max-width: 100%%; height: auto; }
    .header { display: flex; align-items: center; gap: 10px; }
    .header img { width: 64px; height: 64px; border-radius: 8px; }
  </style>
</head>
<body>
  <div class="header">
    <img>
      <xsl:attribute name="src"><xsl:value-of select="rss/channel/image/url"/></xsl:attribute>
    </img>
    <div>
      <h1><xsl:value-of select="rss/channel/title"/></h1>
      <p><xsl:value-of select="rss/channel/description"/></p>
    </div>
  </div>
  <xsl:for-each select="rss/channel/item">
    <div class="item">
      <h2><a>
        <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
        <xsl:value-of select="title"/>
      </a></h2>
      <p><em><xsl:value-of select="pubDate"/> by <xsl:value-of select="dc:creator"/></em></p>
      <div>
        <xsl:choose>
          <xsl:when test="content:encoded">
            <xsl:value-of select="content:encoded" disable-output-escaping="yes"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="description" disable-output-escaping="yes"/>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
  </xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
