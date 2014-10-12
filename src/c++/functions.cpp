#include "functions.h"

int lengthString(char* a){
  int counter = 0;
  while (a[counter] != NULL){
    counter++;
  }
  return counter;
}

bool equal(char* a, char* b){
  int len1 = lengthString(a);
  int len2 = lengthString(b);
  if (len1 == len2){
    int counter = 0;
    while (counter < len1){
      if (a[counter] != b[counter]){
        return false;
      }
      counter++;
    }
    return true;
  }
  return false;
}
