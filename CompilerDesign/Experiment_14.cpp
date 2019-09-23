#include<bits/stdc++.h>

int n,m=0,p,i=0,j=0;
char a[10][10], f[10];
void first(char c);

int main()
{
    int i,z;
    char c,ch;

    printf("Enter the no of prooductions: ");
    scanf("%d",&n);
    printf("Enter the productions: ");
    for(i=0; i<n; i++)
        scanf("%s%c",a[i],&ch);
    do
    {
        m=0;
        printf("Enter the elemets whose first is to be found:");
        scanf("%c",&c);
        first(c);
        printf("First(%c)={",c);
        for(i=0; i<m; i++)
            printf("%c",f[i]);
        printf("}\n");
        strcpy(f," ");
        printf("Continue(0/1)?");
        scanf("%d%c",&z,&ch);
    }
    while(z==1);

    return 0;
}
void first(char c)
{
    int k;
    if(!isupper(c))
        f[m++]=c;

    for(k=0; k<n; k++)
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

