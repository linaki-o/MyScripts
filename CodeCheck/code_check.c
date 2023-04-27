#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>

/* 
 * Things to do:
 *  还需要处理特定类型文件 
 *
 *
 *  */
#define WORK_CONFIG_FILE "work_config_file"
#define MY_CONFIG_FILE "my_config_file"

#define CODE_TIDY "clang-tidy %s --config-file='%s'"

#define PRINT_IN_GREEN(str) printf("\033[32m%s\033[0m\n", str);

char *mode = WORK_CONFIG_FILE; // init as work mode

void deal_with_file(const char *name) {
    PRINT_IN_GREEN(name);
    char cmd[1024];
    sprintf(cmd, CODE_TIDY, name, mode);
    system(cmd);
}
void deal_with_dir(const char *name) {
    DIR *dir;
    struct dirent *entry;
    struct stat statbuf;
    if ((dir = opendir(name)) == NULL) {
        printf("Cannot open directory '%s'\n", name);
        exit(EXIT_FAILURE);
    }
    while ((entry = readdir(dir)) != NULL) {
        char path[1024];
        sprintf(path, "%s/%s", name, entry->d_name);
        if (stat(path, &statbuf) == -1) {
            printf("Cannot stat file '%s'\n", path);
            continue;
        }
        if (S_ISREG(statbuf.st_mode)) {
            deal_with_file(path);
        } else if (S_ISDIR(statbuf.st_mode)) {
            if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
                continue;
            }
            deal_with_dir(path);
        }
    }
    closedir(dir);
}
int main(int argc, char *argv[]) {
    int opt;
    char *filename = NULL;
    struct stat statbuf;

    while ((opt = getopt(argc, argv, "mf:h")) != -1) {
        switch (opt) {
            case 'm': // 可以优化一下
                mode = MY_CONFIG_FILE;
                break;
            case 'f':
                filename = optarg;
                break;
            case 'h':
                printf("Usage: %s [-m] -f filename [-h]\n", argv[0]);
                printf("  -m\t\tOptional flag, set mode to customized version\n");
                printf("  -f filename\tRequired option with argument, set name to argument\n");
                printf("  -h\t\tOptional help option, print this message\n");
                exit(EXIT_SUCCESS);
            default:
                printf("Usage: %s [-m] -f filename [-h]\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    if (filename == NULL) {
        printf("Usage: %s [-m] -f filename [-h]\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    if (stat(filename, &statbuf) == -1) {
        printf("Cannot stat file '%s'\n", filename);
        exit(EXIT_FAILURE);
    }
    if (S_ISREG(statbuf.st_mode)) {
        deal_with_file(filename);
    } else if (S_ISDIR(statbuf.st_mode)) {
        deal_with_dir(filename);
    }

    return 0;
}
