
#include "getmaxlen.h"
int getMaxLen(int *sel,int N)
{
    int n1 = 1, n2 = 1, i;

    for(i = 1; i<N; i++) {
        if(sel[i]>sel[i-1]) {
            n2 ++;
            if(n2 > n1) {
                n1 = n2;
            }
        } else {
            n2 = 1;
        }
    }

    return n1;
}

