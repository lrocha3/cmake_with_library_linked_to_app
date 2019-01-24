#include <iostream>
#include <stdio.h>
#include <stdlib.h>


#include <definitions.h>
#include <printer.h>

using namespace std;

int main(void)
{
	string myMessageToPrint =  "My Message: " + std::to_string(MY_MESSSAGE_ID) + "\n";
	printToScreen(myMessageToPrint);

	return 0;
}
