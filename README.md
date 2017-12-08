# FMPXMLRESULT2generator

FMPXMLRESULT2generator is a project to convert data quickly from FileMaker and to keep the attribute/entity/column/table/field names

## General note – stylesheet regardless

None of these are candidates for a beauty contest; all of them however are made with one thought in mind, FileMaker as the single source of truth, a high level of conformity across your solution, natively on all accounts. The intended use is for these stylesheets to serve as a quick starting point for generating a native interface with FileMaker as the single source of truth and high conformity across your solution.

No records required; however exporting a random record may give you extra data to work with.

### CRUD is often confusing

as CRUD only contains 4 letters; here is a good read on the difference between the 2 Us in CRUD; namely PATCH and PUT: https://stackoverflow.com/questions/28459418/rest-api-put-vs-patch-with-real-life-examples#34400076 and https://stackoverflow.com/questions/28459418/rest-api-put-vs-patch-with-real-life-examples/39338329#39338329

## This is a PoC( Proof of Concept )

Note adding a layout name in the FMPXMLRESULT export; before translating using this XSLT, will make the output more complete.

<img alt="[x] Format Using Layout will provoke the export to populate the LAYOUT-attribute" src="FormatUsingLayout.png" width="100%" max-width=1008>

How to use these files in terminal
---
```bash
$ xsltproc fmpxmlresult2nodeexpress.xslt test.xml > ~/projectname/route/view.js
```

For using this in FileMaker use File -> Export Records use filetype XML and point to the raw file on github for the [XSLT](https://raw.githubusercontent.com/TyrfingMjolnir/fmpxmlresult2nodeexpress/master/fmpxmlresult2nodeexpress.xslt)

If you do not like the verbs used for the calls you can have a look [here](http://stackoverflow.com/questions/630453/put-vs-post-in-rest) to do some qualified changes. Perhaps using patch instead of put for your UPDATE will be for the better?

Sample files
---
test.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
  <ERRORCODE>0</ERRORCODE>
  <PRODUCT BUILD="03-22-2017" NAME="FileMaker" VERSION="ProAdvanced 16.0.1" />
  <DATABASE DATEFORMAT="M/d/yyyy" LAYOUT="contact" NAME="Untitled.fmp12" RECORDS="1" TIMEFORMAT="h:mm:ss a" />
  <METADATA>
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactActive" TYPE="NUMBER" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactCountry" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactEpost" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactID" TYPE="NUMBER" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactName" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactTown" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactZIP" TYPE="TEXT" />
  </METADATA>
  <RESULTSET FOUND="1">
    <ROW MODID="0" RECORDID="1">
      <COL>
        <DATA>1</DATA>
      </COL>
      <COL>
        <DATA>contactCountry</DATA>
      </COL>
      <COL>
        <DATA>contactEpost</DATA>
      </COL>
      <COL>
        <DATA>contactID</DATA>
      </COL>
      <COL>
        <DATA>contactName</DATA>
      </COL>
      <COL>
        <DATA>contactTown</DATA>
      </COL>
      <COL>
        <DATA>contactZIP</DATA>
      </COL>
    </ROW>
  </RESULTSET>
</FMPXMLRESULT>
```

~/projectname/route/contact.js

```js
// To be called from app.js like this: app.use('/contact', require('./contact'));
const
  express = require( 'express' ),
  routernode  = express.Router();

// Create
routernode.post( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP POST query' );
});

// Read
routernode.get( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP GET query' );
});

// Update overwrite record
routernode.put( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP PUT query' );
});

// Update overwrite a selection of fields in a record
routernode.patch( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP PATCH query' );
});

// Delete
routernode.delete( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP DELETE query' );
});

module.exports = routernode;
```

## fmpxmlresult2nodeexpressFullCRUD.xslt

This file loads every field/column as a potential parameter in the template, there's most likely no purpose to use all fields as parameters, however it must be easier to delete those you do not need than to risk a typo. After all removing the source of human failure in the naming and typo department is the main goal of these scripts.

## fmpxmlresult2HTMLtable.xslt
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to HTML table, no records required. 

## fmpxmlresult2HTMLform.xslt
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to HTML form, no records required.

## fmpxmlresult2nodeexpress.xslt
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to JSON route node for express, no records required. 

## fmpxmlresult2pgCOPY.xslt
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to postgres' COPY-format with records. 

## fmpxmlresult2CoreDatacontent.xslt
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to CoreData content format. 

## fmpxmlresult2LaTeX.xslt
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to LaTeX' TeX-format for the purpose of PDF production.

License
=======

Copyright (c) 1999 - present Gjermund Gusland Thorsen, released under the MIT License.

All rights deserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

This piece of software comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.

Note
====
Most files have 2 years mentioned, the years are the year, put in production, and the year published here on github or otherwise. Most basis for these files were written 1999 through 2004, later some of these files have resurfaced for newer projects and their "lowest common denominators" have been released.
