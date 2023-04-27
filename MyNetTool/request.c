/* Things to do: 
*     1. 自适应能力根据不同的status code做出不同的处理 
*     2. 做出一些封装
*     */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>

#define DEBUG(str) printf("\033[1;31m%s\033[0m\n", str);
#define PORT 80
#define BUFFER_SIZE 1024

int main(int argc, char *argv[]) {
    char *url = argv[1];
    char *host;
    char *path;
    char *request;
    char buffer[BUFFER_SIZE];
    int sockfd;
    struct sockaddr_in serv_addr;
    struct hostent *he;
    int bytes_received;

    // 解析URL以获取主机名和请求文件名
    /* host = strtok(url + 7, "/"); // http */
    host = strtok(url + 8, "/"); // https
    DEBUG(host); 
    path = strtok(NULL, ""); // interesting
    DEBUG(path); 

    // 使用gethostbyname()函数将主机名解析为IP地址
    if ((he = gethostbyname(host)) == NULL) {
        printf("Failed to resolve hostname\n");
        return 1;
    }

    // 使用socket()函数创建套接字并使用connect()函数连接到主机的IP地址和端口
    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        printf("Failed to create socket\n");
        return 1;
    }

    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);
    serv_addr.sin_addr = *((struct in_addr *) he->h_addr);

    if (connect(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) {
        printf("Failed to connect to server\n");
        return 1;
    }

    // 构造HTTP请求报文并使用send()函数将其发送到主机
    request = (char *) malloc(strlen(path) + strlen(host) + 18);
    sprintf(request, "GET /%s HTTP/1.1\r\nHost: %s\r\n\r\n", path, host);

    if (send(sockfd, request, strlen(request), 0) < 0) {
        printf("Failed to send request\n");
        return 1;
    }

    // 使用recv()函数接收响应报文并将其打印到终端
    while ((bytes_received = recv(sockfd, buffer, BUFFER_SIZE - 1, 0)) > 0) {
        buffer[bytes_received] = '\0';
        printf("%s", buffer);
    }

    close(sockfd);
    free(request);

    return 0;
}
