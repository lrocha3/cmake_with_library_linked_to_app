#include <iostream>
#include <stdio.h>
#include <stdlib.h>


#include <XmlWrapper.h>

#include <tinyxml.h>

using namespace std;

const char *XMLFileName = "persons.xml"; 

void writeXmlDocument(void)
{
	TiXmlDocument doc;
	TiXmlDeclaration * decl = new TiXmlDeclaration( "1.0", "", "" );
	doc.LinkEndChild( decl );
	
	TiXmlElement * element = new TiXmlElement( "Hello" );
	doc.LinkEndChild(element);
	
	TiXmlText * text = new TiXmlText( "World" );
	element->LinkEndChild( text );
	
	doc.SaveFile(XMLFileName);
};