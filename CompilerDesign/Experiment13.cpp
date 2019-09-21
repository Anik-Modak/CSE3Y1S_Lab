#include<bits/stdc++.h>
using namespace std;

bool isArithmetic(char ch)
{
    if (ch == '+' || ch == '-' || ch == '*' || ch == '/')
        return true ;
    else
        return false ;
}

bool check(string s)
{
    int cnt = 0, len = s.size();
    for(int i=0; i<len-1; i++)
    {
        if(isArithmetic(s[i]) && isArithmetic(s[i+1]))
            return 0;
        if(s[i]=='(' && (s[i+1]==')'|| isArithmetic(s[i+1])))
            return 0;
        if(s[i]==')' && (s[i+1]=='('|| isalpha(s[i+1]) || isdigit(s[i+1])))
            return 0;

        if(s[i]=='(')
            cnt++;
        if(s[i]==')')
            cnt--;
    }

    if(s[len-1]=='(')
        cnt++;
    if(s[len-1]==')')
        cnt--;

    if(cnt)
        return 0;
    return 1;
}

int main()
{
    string s;
    cout<<"Enter a string: "; cin>>s;

    int len = s.size(), cnt = 0;
    for(int i=0; i<len; i++)
    {
        if(isArithmetic(s[i]) || isalpha(s[i]) || isdigit(s[i]) || s[i]=='(' || s[i]==')')
            cnt++;
    }

    //cout<<len<<" "<<cnt<<endl;
    if(len != cnt)
    {
        cout<<"Output: INVALID\n";
        return 0;
    }

    if(check(s))
        cout<<"Output: VALID\n";
    else
        cout<<"Output: INVALID\n";
    return 0;
}
