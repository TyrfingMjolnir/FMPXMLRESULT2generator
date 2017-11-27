<?xml version="1.0" encoding="UTF-8"?>
<!--
  Written by Gjermund G Thorsen 2017, all rights deserved
  for the purpose of generating an HTML form component from FMPXMLRESULT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0" exclude-result-prefixes="fmp">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="fmp:FMPXMLRESULT">
		<html lang="no" class="desktop">
		<head>
				<title>
					<xsl:value-of select="$databaseName"/>
				</title>
			</head>
			<body>
				<form>
					<xsl:attribute name="method">
						<xsl:text>POST</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="$databaseName"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="$layoutName"/>
					</xsl:attribute>
					<xsl:attribute name="id">
						<xsl:value-of select="$databaseName"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="$layoutName"/>
					</xsl:attribute>
					<xsl:call-template name="header"/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="header">
		<fieldset>
			<legend>
				<xsl:value-of select="$layoutName"/>
			</legend>
			<ul>
				<xsl:for-each select="fmp:METADATA/fmp:FIELD">
					<li>
						<label>
							<xsl:value-of select="@NAME"/>
							<input>
								<xsl:attribute name="id">
									<xsl:value-of select="@NAME"/>
								</xsl:attribute>
								<xsl:attribute name="name">
									<xsl:value-of select="@NAME"/>
								</xsl:attribute>
								<xsl:attribute name="type">
									<xsl:value-of select="@TYPE"/>
								</xsl:attribute>
<!--								<xsl:attribute name="pattern">
									<xsl:text>[0-9][A-Z][a-z]{3}</xsl:text>
								</xsl:attribute>
-->								<xsl:attribute name="EMPTYOK">
									<xsl:value-of select="@EMPTYOK"/>
								</xsl:attribute>
								<xsl:attribute name="placeholder">
									<xsl:text>1 numeric, 1 UPPERCASE, 3 lowercase</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="autofocus">
									<xsl:text>autofocus</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="autocomplete">
									<xsl:text>off</xsl:text>
								</xsl:attribute>
							</input>
						</label>
					</li>
				</xsl:for-each>
				<li>
					<input>
						<xsl:attribute name="id">
							<xsl:text>button</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="name">
							<xsl:text>a</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="type">
							<xsl:text>submit</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:text>Create New Record</xsl:text>
						</xsl:attribute>
					</input>
					<input type="reset" value="Reset"/>
				</li>
			</ul>
		</fieldset>
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
