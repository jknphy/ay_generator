<?xml version="1.0"?>
<!--
  Style sheet to adjust autoyast control file

  Copyright © 2018 SUSE LLC

  Copying and distribution of this file, with or without modification,
  are permitted in any medium without royalty provided the copyright
  notice and this notice are preserved.  This file is offered as-is,
  without any warranty.

  Summary:
  Maintainer: Joaquín Rivera <jeriveramoya@suse.com>
-->
<xsl:stylesheet xmlns:y="http://www.suse.com/1.0/yast2ns" xmlns:config="http://www.suse.com/1.0/configns" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.suse.com/1.0/yast2ns" version="2.0">

  <xsl:output method="xml" cdata-section-elements="source"/>

  <xsl:param name="scc_regcode" select="'UNDEFINED'" />
  <xsl:param name="scc_url" select="'UNDEFINED'" />
  <xsl:param name="arch" select="'UNDEFINED'" />
  <xsl:param name="scc_addons" select="'UNDEFINED'" />

  <xsl:variable name="scc_addons_expanded" select="replace(replace(replace($scc_addons,
    'bs', 'sle-module-basesystem'),
    'sa', 'sle-module-server-applications'),
    'desktop', 'sle-module-desktop-applications')" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="//*[@ifarch != '']">
    <xsl:if test="contains(@ifarch, $arch)">
      <xsl:element name="{name()}">
        <xsl:apply-templates select="@*[name() != 'ifarch']|node()" />
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/y:profile/y:suse_register">
    <xsl:apply-templates select = "y:reg_code" />
    <xsl:apply-templates select = "y:reg_server" />
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="y:reg_code">
    <xsl:copy>
      <xsl:value-of select="$scc_regcode" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="y:reg_server">
    <xsl:copy>
      <xsl:value-of select="$scc_url" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/y:profile/y:suse_register/y:addons/y:addon/y:arch">
    <xsl:copy>
      <xsl:value-of select="$arch" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/y:profile/y:suse_register/y:addons/y:addon[y:name[not(contains($scc_addons_expanded, text()))]]"/>

</xsl:stylesheet>
