#include<bits/stdc++.h>
#define MX 1005
using namespace std;

char str[MX], tree[MX];
char gram[][10] = {"E+E","E-E","E*E","E/E","(E)","a","b","c"};

void str_replace(int pos, char st[])
{
    int i;
    for(i=0; st[i]; i++)
    {
        tree[pos+i] = st[i];
    }
    tree[pos+i] = '\0';
}

int main()
{
    printf("Enter Sentence: ");
    scanf("%s",str);

    strcpy(tree, "E");
    puts("Syntax Tree:\nE");

    int op, ln = strlen(str), i = 0, j = 0;
    while(i < ln)
    {
        if(i+1 < ln)
        {
            if(str[i+1]=='+')
                op = 0;
            else if(str[i+1]=='-')
                op = 1;
            else if(str[i+1]=='*')
                op = 2;
            else
                op =3;

            str_replace(j, gram[op]);
            puts(tree);
        }

        tree[j] = str[i];
        puts(tree);

        j += 2;
        i += 2;
    }
    return 0;
}


/*string grammar[] = {"E+E", "E-E", "E*E", "E/E", "(E)", "a", "b", "c"};
int main()
{
    string s;
    cin>>s;

    string res = "E";

    int i=1;
    cout<<res<<endl;
    while(res.size() != s.size())
    {
        res = res + s[i];
        res = res + "E";
        cout<<res<<endl;
        res[i-1] = s[i-1];
        cout<<res<<endl;
        i+=2;
    }
    res[res.size()-1] = s[s.size()-1];
    cout<<res<<endl;
    return 0;
}*/
