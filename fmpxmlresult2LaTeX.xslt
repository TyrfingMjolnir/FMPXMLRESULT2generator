<?xml version="1.0" encoding="UTF-8"?>
<!--
  Written by Gjermund G Thorsen 2017, all rights deserved
  for the purpose of generating an HTML form component from FMPXMLRESULT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
  <xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
  <xsl:template match="fmp:FMPXMLRESULT">
    <xsl:text>\documentclass[fontsize=12pt, paper=a4]{scrlttr2}</xsl:text>
    <xsl:text/>
    <xsl:text>\setkomavar{fromname}{}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\setkomavar{fromaddress}{</xsl:text>
    <xsl:value-of select="COL/DATA[1]"/>
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\setkomavar{signature}{} </xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\renewcommand{\raggedsignature}{\raggedright}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\setkomavar{subject}{}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\begin{document}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\begin{letter}{Name and \\ Address \\ of \\ Recipient}</xsl:text>
    <xsl:for-each select="fmp:RESULTSET/fmp:ROW">
      <xsl:for-each select="fmp:COL">
        <xsl:choose>
          <xsl:when test="position()=last">
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="fmp:DATA"/>
            <xsl:value-of select="$delimiter"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <xsl:choose>
        <xsl:when test="position()=last()">
          <xsl:text>&#10;</xsl:text>
          <xsl:text>\closing{}</xsl:text>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>\end{letter}</xsl:text>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>\end{document}</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$newrecord"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:variable name="delimiter">
    <xsl:text>&#10;</xsl:text>
  </xsl:variable>
  <xsl:variable name="newrecord">
    <xsl:text>&#10;</xsl:text>
  </xsl:variable>
</xsl:stylesheet>
<!--
===============================================================
Copyright © 2008 Gjermund Gusland Thorsen
All rights deserved.

Redistribution and use in any form, with or without modification,
are permitted provided that the following conditions:

* Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

* Redistributions in any form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in 
  the documentation and/or other materials provided.

This piece comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
    
===============================================================
-->
