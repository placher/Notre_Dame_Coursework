#include <stdio.h>

int main(void){
int a,b,c;
a = 7;
b = 6 + a--;
c = b++ + --a;
printf("%d %d %d",a,b,c);
}
