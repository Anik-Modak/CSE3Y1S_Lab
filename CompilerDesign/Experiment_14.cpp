#include<bits/stdc++.h>

int n, m;
char a[10][10], f[10];

void first(char c)
{
    if(!isupper(c))
        f[m++]=c;

    for(int k=0; k<n; k++)
    {
        if(a[k][0]==c)
        {
            if(islower(a[k][2]) || a[k][2]=='0')
                f[m++]=a[k][2];
            else
                first(a[k][2]);
        }
    }
}

int main()
{
    int z;
    printf("Enter the no of prooductions: ");
    scanf("%d",&n);

    char c, ch;
    printf("Enter the productions: ");
    for(int i=0; i<n; i++)
        scanf("%s%c",a[i],&ch);
    do
    {
        m=0;
        printf("Enter the elemets whose first is to be found:");
        scanf("%c",&c);
        first(c);

        printf("First(%c)={",c);
        for(int i=0; i<m; i++)
            printf("%c",f[i]);
        printf("}\n");

        strcpy(f," ");
        printf("Continue(0/1)?");
        scanf("%d%c",&z,&ch);
    }
    while(z==1);
    return 0;
}

