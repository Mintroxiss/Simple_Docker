#include <fcgi_stdio.h>
#include <stdio.h>

int main(void) {
	while(FCGI_Accept() >= 0) {
		printf("Content-type: text/html\r\n\r\nHello World!\r\n\r\n");
	}
	return 0;
}
