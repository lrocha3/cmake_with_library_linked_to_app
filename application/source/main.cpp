#include <iostream>
#include <stdio.h>
#include <stdlib.h>


#include <XmlWrapper.h>
#include <printer.h>


using namespace std;

int main(void)
{
	string myMessageToPrint =  "My Message: Reading File\n";
	printToScreen(myMessageToPrint);

	writeXmlDocument();
}
