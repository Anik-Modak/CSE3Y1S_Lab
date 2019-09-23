#include <stdio.h>
#include <string.h>

char options[][10] = {"E+E","E-E","E*E","E/E","(E)","a","b","c"};
char tr[100],s[100];
void repl(int pos,char *s)
{
    //
    int i,ln,l2=strlen(s);
    ln=strlen(tr);

    for(i=ln+l2-1; i>=pos; i--)
    {
        tr[i]=tr[i-l2+1];
    }
    //P(tr)
    for(i=0; i<l2; i++)
    {
        tr[i+pos]=s[i];
    }
}

int main()
{
    int i,j,a,b,ts,f=1,cn=0,ln,op=0;
    //freopen("test.txt","r",stdin);
    strcpy(tr,"E");
    //input: a+b*c+d/f-g*m
    // input must not contain space
    scanf("%s",s);
    ln=strlen(s);
    puts(tr);
    for(i=0,j=0; i<ln;)
    {
        //choiceing proper grammer
        if(tr[j]=='E'&&i+1<ln)
        {
            switch (s[i+1])
            {
            case '+':
                op=0;
                break;
            case '-':
                op=1;
                break;
            case '*':
                op=2;
                break;
            case '/':
                op=3;
                break;
            case '(':
                op=4;
                break;
            }

            repl(j,options[op]);//replacement of E with proper options
            puts(tr);
            tr[j]=s[i];
            puts(tr);
            j+=2;
            i+=2;
        }
        else if(tr[j]=='E')
        {
            tr[j]=s[i];
            puts(tr);
            i++;
        }
    }
    return 0;
}
