#include <stdio.h>
void voidAdd(int num1, int num2, int* out){
  int r = num1 + num2;
  *out = num1 + num2;
}
int main(void){
  int* out;
  voidAdd(1, 2, out);
  printf("%i\n", *out);
  return 0;
}
