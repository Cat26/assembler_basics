#include<stdio.h>

int main(){
  char *s = "ABC";

  asm volatile (
  ".intel_syntax noprefix;"
  "mov ebx, %1;"
  "petla:"

  "mov al, [ebx];" //w al mamy wartos na ktora wskazuje ebx
  "mov [ebx], al;"
  "cmp al, 0;"
  "je koniec;"//skok jeśli równe
  "cmp al, 0x41;"
  "jb skip;"
  "cmp al, 0x5a;"
  "ja skip;"
  "xor al, 0x20;"
  // "mov dl, al;"
  // "mov [ebx], dl;"

  "skip:"

  "inc ebx;"

  "jmp petla;"
  "koniec:"
  "mov %0, ebx;"

  ".att_syntax prefix;"

  : "=r" (s)
  : "r" (s)
  : "eax", "ebx", "ecx"
  );
  // printf("start text=%i\n", b);
  printf("lowercase text=%s\n", s);
  return 0;
}
