#include<stdio.h>

int main(){
  int x = 0xB7;
  int y;

  asm volatile (
  ".intel_syntax noprefix;"
  "mov eax, %1;"
  // "mov ecx, 0;"//zaladowanie zera do rejestru
  "xor ecx, ecx;"//lepsza wersja zerowania rejestrow
  // "mov ebx, 0;"
  "xor ebx, ebx;"
  "petla:"

  "shl eax, 1;"
  "jnc skok;"
  // "add ebx, 1;"
  "inc ebx;"//incrementacja lepiej niz powyzej
  "skok:"

  // "add ecx, 1;"
  "inc ecx;"
  "cmp ecx, 32;" //porownaj ecs z liczba 32
  "jnz petla;"
  "mov %0, ebx;"
  ".att_syntax prefix;"

  : "=r" (y)
  : "r" (x)
  : "eax", "ebx", "ecx"
  );
  printf("x=%i, y=%i\n", x, y);
  return 0;
}
