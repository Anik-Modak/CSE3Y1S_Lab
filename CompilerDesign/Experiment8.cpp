//Anik_Modak
#include<bits/stdc++.h>
using namespace std;

string keyword[35] = {"auto","double","int","struct","break","else","long",
                     "switch","case","enum","register","typedef","char",
                     "extern","return","union","const","float","short",
                     "unsigned","continue","for","signed","void","default",
                     "goto","sizeof","voltile","do","if","static","while","bool"};

bool isArithmetic( string ch)
{
    if (ch == "+" || ch == "-" || ch == "*" || ch == "/" || ch == "%" || ch == "=")
        return true ;
    else
        return false ;
}

bool isRelational( string ch)
{
    if (ch == "<" || ch == ">" || ch == "!=" || ch == "==" || ch == "<=" || ch == ">=" || ch == "||" || ch == "&&")
        return true ;
    else
        return false ;
}

bool isIncrement( string ch)
{
    if (ch == "++" || ch == "--")
        return true ;
    else
        return false ;
}

bool isLogical( string ch)
{
    if (ch == "&&" || ch == "||")
        return true;
    else
        return false;
}

bool identifier(string s)
{
    if(isalpha(s[0]) || s[0]=='_')
    {
        int cnt = 0, len = s.size();
        for(int i=0; i<len; i++)
            if(isdigit(s[i]) || isalpha(s[i]) || s[i]=='_')
                cnt++;
        if(cnt==len)
            return 1;
    }
    return 0;
}

int main()
{
    freopen("Experiment8.cpp","r",stdin);
    freopen("output.txt","w",stdout);

    string s;
    while (cin>>s)
    {
        int len = s.size();
        cout<<"\n"<<s<<" : ";
        if(len == 1 && isArithmetic(s))
            cout<<"Arithmetic Operator"<<endl;
        else if (isRelational(s))
            cout<<"Relational Operator"<<endl;
        else if (isIncrement(s))
            cout<<"Increment Decrement Operator"<<endl;
        else if(isLogical(s))
            cout<<"Logical Operator"<<endl;
        else
        {
            int ck = 0;
            for(int i = 0; i < 34; i ++ )
            {
                if (s == keyword[i])
                    ck = 1;
            }
            if (ck == 1)
                cout<<"Keyword"<<endl;
            else if(identifier(s))
                cout<<"identifier"<<endl;
            else
                cout<<"Invalid Input"<<endl;
        }
    }
    return 0;
}
