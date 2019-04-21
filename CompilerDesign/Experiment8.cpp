//Anik_Modak
#include<bits/stdc++.h>
using namespace std;

string keyword[32]= {"auto","double","int","struct","break","else","long",
                     "switch","case","enum","register","typedef","char",
                     "extern","return","union","const","float","short",
                     "unsigned","continue","for","signed","void","default",
                     "goto","sizeof","voltile","do","if","static","while"
                    } ;
int main()
{
    string s;
    cin>>s;

    int len = s.size(), dot = 0, digit = 0, oper = 0, cnt = 0;
    for(int i=0; i<len; i++)
    {
        if(isdigit(s[i]))
            digit++;
        if(s[i]=='.')
            dot=1;
        if(s[i]=='+' || s[i]=='-' || s[i]=='*' || s[i]=='/' || s[i]=='%')
            oper++;

        if(isalpha(s[i]) || isdigit(s[i]))
            cnt++;
    }

    if(oper==len)
        cout<<"Arithmetic Operator"<<endl;
    else if(digit==len)
        cout<<"Integer"<<endl;
    else if(digit==len-1 && dot==1)
        cout<<"Float"<<endl;
    else
    {
        int ck = 0;
        for(int i=0; i<32; i++)
        {
            if(s==keyword[i])
                ck = 1;
        }

        if(ck==1)
            cout<<"Keyword"<<endl;
        else if(cnt==len)
            cout<<"Identifier"<<endl;
        else
            cout<<"Invalid Input"<<endl;
    }
    return 0;
}
