#include<bits/stdc++.h>
using namespace std;

bool isOper(char s)
{
    if(s=='+' || s=='-' || s=='*' || s=='/')
        return true;
    return false;
}

bool validity(char *str)
{
    for(int i=1; str[i]; i+=2)
    {
        char opr = str[i], opd = str[i+1];
        if(!isdigit(opd))
            return 0;
        if(isOper(opr))
            continue;
        else
            return 0;
    }
    return 1;
}

int main()
{
    char s[1000];
    gets(s);

    if(validity(s))
        printf("VALID\n");
    else
        printf("INVALID\n");
    return 0;
}
