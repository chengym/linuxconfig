#include <stdio.h>
#include <dlfcn.h>

int main()
{
    void *handle = NULL;
    int (*_g_echo)();

    handle = dlopen("./libecho.so", RTLD_LAZY);
    if(!handle) {
        printf("dll loading error\n");
        return -1;
    }

    _g_echo = (int(*)())dlsym(handle, "echo");

    if(NULL != dlerror()) {
        printf("fun load error\n");
        return 0;
    }

    _g_echo();
    return 0;
}
