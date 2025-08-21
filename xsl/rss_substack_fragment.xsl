<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">

  <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" />

  <xsl:template match="/">
    <div id="feed-root">
      <div class="feed-header">
        <xsl:if test="rss/channel/image/url">
          <img>
            <xsl:attribute name="src"><xsl:value-of select="rss/channel/image/url"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="rss/channel/title"/></xsl:attribute>
          </img>
        </xsl:if>
        <div>
          <h1 class="feed-title"><xsl:value-of select="rss/channel/title"/></h1>
          <p class="feed-desc"><xsl:value-of select="rss/channel/description"/></p>
          <p class="meta"><a><xsl:attribute name="href"><xsl:value-of select="rss/channel/link"/></xsl:attribute><xsl:value-of select="rss/channel/link"/></a></p>
        </div>
      </div>

      <xsl:for-each select="rss/channel/item">
        <div class="card">
          <h2>
            <a class="title">
              <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
              <xsl:value-of select="title"/>
            </a>
          </h2>
          <div class="meta">
            <xsl:if test="pubDate">Published: <xsl:value-of select="pubDate"/> • </xsl:if>
            <xsl:if test="dc:creator">By <xsl:value-of select="dc:creator"/></xsl:if>
          </div>
          <div class="content">
            <xsl:choose>
              <xsl:when test="string-length(normalize-space(content:encoded)) &gt; 0">
                <xsl:value-of select="content:encoded" disable-output-escaping="yes"/>
              </xsl:when>
              <xsl:otherwise>
                <p><xsl:value-of select="description" disable-output-escaping="yes"/></p>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>
</xsl:stylesheet>
