#include <stdio.h>
#include <netdb.h>
#include <arpa/inet.h>

int main(int argc, char *argv[]) {
    char *hostname = "www.google.com";
    struct hostent *he;
    struct in_addr **addr_list;
    int i;

    if ((he = gethostbyname(argv[1])) == NULL) {
        printf("Failed to resolve hostname\n");
        return 1;
    }

    addr_list = (struct in_addr **) he->h_addr_list;

    for (i = 0; addr_list[i] != NULL; i++) {
        printf("%s\n", inet_ntoa(*addr_list[i]));
    }

    return 0;
}
