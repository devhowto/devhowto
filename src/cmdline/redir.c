#include <stdio.h>

int main(void) {
  fprintf(stdout, "%s\n", "OK");
  fprintf(stderr, "%s\n", "ERR");
  return 0;
}
