<?xml version="1.0" encoding="UTF-8"?><!--
  Written by Gjermund G Thorsen 2017, all rights deserved
  for the purpose of generating an HTML form component from FMPXMLRESULT
--><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" exclude-result-prefixes="fmp">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="fmp:FMPXMLRESULT">
		<html>
			<head>
				<title>
					<xsl:text>Schema/table: </xsl:text><xsl:value-of select="$databaseName"/><xsl:text>.</xsl:text><xsl:value-of select="$layoutName"/>
				</title>
			</head>
			<body>
				<table border="0" cellPadding="3" cellSpacing="0">
					<xsl:call-template name="header"/>
					<xsl:call-template name="mainbody"/>
					<xsl:call-template name="footer"/>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="header">
		<tr>
			<td align="middle">
				<xsl:value-of select="$databaseName"/><xsl:text>.</xsl:text><xsl:value-of select="$layoutName"/>
			</td>
		</tr>
		<tr>
			<td align="middle">
				<xsl:text>Number of records: </xsl:text><xsl:value-of select="fmp:DATABASE/@RECORDS"/>
			</td>
		</tr>
		<tr>
			<xsl:for-each select="fmp:METADATA/fmp:FIELD">
				<th>
					<xsl:value-of select="@NAME"/>
				</th>
			</xsl:for-each>
		</tr>
	</xsl:template>
	<xsl:template name="mainbody">
		<tr>
			<xsl:for-each select="fmp:METADATA/fmp:FIELD">
				<td>
					<xsl:attribute name="align">
							<xsl:value-of select="concat(
			              substring( 'left',      1 div boolean( @TYPE  = 'TEXT'      ) ),
			              substring( 'middle',      1 div boolean( @TYPE  = 'CONTAINER' ) ),
			              substring( 'middle',      1 div boolean( @TYPE  = 'DATE'      ) ),
			              substring( 'middle', 1 div boolean( @TYPE  = 'TIMESTAMP' ) ),
			              substring( 'right',   1 div boolean( @TYPE  = 'NUMBER'    ) )
)"/>						
					</xsl:attribute>
					<xsl:text>{{</xsl:text><xsl:value-of select="$layoutName"/><xsl:text>.</xsl:text><xsl:value-of select="@NAME"/><xsl:text>}}</xsl:text>
				</td>
			</xsl:for-each>
		</tr>
	</xsl:template>
	<xsl:template name="footer">
		<tr>
			<td align="middle">
				<xsl:text>FileMaker Pro Version: </xsl:text><xsl:value-of select="fmp:PRODUCT/@VERSION"/>
			</td>
		</tr>
		<tr>
			<td align="middle">
				<xsl:text>Build: </xsl:text><xsl:value-of select="fmp:PRODUCT/@BUILD"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="numfields" match="fmp:METADATA">
		<xsl:value-of select="count(fmp:METADATA/child::*)"/>
	</xsl:template>
	<xsl:variable name="databaseName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME"/>
	</xsl:variable>
	<xsl:variable name="layoutName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT"/>
	</xsl:variable>
</xsl:stylesheet><!--
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
