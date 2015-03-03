#include <stdio.h>
#include <dlfcn.h>

int main()
{
    void *handle = NULL;
    int (*getMaxLen)(int *sel,int N);
    int sel[] = {1,2,5,4,5,8,6,5,9,5,4,5,4,1};

    handle = dlopen("./libgetmaxlen.so",RTLD_LAZY);
    if(handle == NULL)
    {
        printf("dll loading error.\n");
        return 0;
    }

    getMaxLen = (int(*)(int *,int))dlsym(handle,"getMaxLen");
    if(dlerror()!=NULL)
    {
        printf("fun load error.\n");
        return 0;
    }
    printf("%d\n",getMaxLen(sel,15));
}
