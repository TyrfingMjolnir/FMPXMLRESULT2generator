<?xml version="1.0" encoding="UTF-8"?>
<!-- Written by Gjermund G Thorsen 2015, all rights deserved
If you are using an older or newer version of XCode than 8.2.1 you may want to copy/paste the model element from your own CoreData file
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="fmp:FMPXMLRESULT">
		<model userDefinedModelVersionIdentifier="" type="com.apple.IDECoreDataModeler.DataModel" documentVersion="1.0" lastSavedToolsVersion="6751" systemVersion="13F1911" minimumToolsVersion="Automatic" macOSVersion="Automatic" iOSVersion="Automatic">
			<xsl:value-of select="$tableName"/>
			<entity name="{$databaseName}.{$tableName}" syncable="YES">
				<xsl:for-each select="fmp:METADATA/fmp:FIELD">
					<attribute name="{@NAME}" optional="YES" attributeType="{concat(
			              substring( 'String',			1 div boolean( @TYPE  = 'TEXT'      ) ),
			              substring( 'Binary',			1 div boolean( @TYPE  = 'CONTAINER' ) ),
			              substring( 'Date',				1 div boolean( @TYPE  = 'DATE'      ) ),
			              substring( 'Date',				1 div boolean( @TYPE  = 'TIMESTAMP' ) ),
			              substring( 'Date',				1 div boolean( @TYPE  = 'TIME'      ) ),
			              substring( 'Integer 64',	1 div boolean( @TYPE  = 'NUMBER'    ) )
			              )}" defaultValueString="0" syncable="YES" />
				</xsl:for-each>
			</entity>
		<elements>
			<element name="{$databaseName}.{$tableName}" positionX="-27" positionY="-16" width="128" height="208" />
		</elements>
		</model>
	</xsl:template>
	<xsl:variable name="databaseName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME"/>
	</xsl:variable>
	<xsl:variable name="tableName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT"/>
	</xsl:variable>
	<xsl:variable name="timeformat">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@TIMEFORMAT"/>
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
