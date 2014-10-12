#include "Value.h"

/*****************************************************************************/
/*********************************** Value ***********************************/
/*****************************************************************************/

Value::Value() {
	type = TYPE_NULL;
}


Type Value::getType(){
	return type;
}

/******************************* Integer Value *******************************/

IntegerValue::IntegerValue(int a){
	value = a;
	type 	= TYPE_INT;
}

int IntegerValue::getValue(){
	return value;
}

/******************************* String Value ********************************/

StringValue::StringValue(char* a){
	value = a;
	type 	= TYPE_STR;
}

char* StringValue::getValue(){
	return value;
}