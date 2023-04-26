#include <iostream>
#include <cstdlib>
#include "add.h"
using namespace std;
class hi {
    int INT;
    string STRING;
};
int main() {
    char *name = (char *)malloc(7 * sizeof(char));
    cout <<  add(1, 2) << endl;
    return 0;
}
