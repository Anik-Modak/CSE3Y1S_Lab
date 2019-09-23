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
    stack<char>st;
    int cnt = 0, len = s.size();
    for(int i=0; i<len-1; i++)
    {
        if(isArithmetic(s[i]) && ( s[i+1] == ')' || isArithmetic(s[i+1])))
            return 0;
        if(s[i]=='(' && (s[i+1]==')'|| isArithmetic(s[i+1])))
            return 0;
        if(s[i]==')' && (s[i+1]=='('|| isalpha(s[i+1]) || isdigit(s[i+1])))
            return 0;

        if(s[i]=='(')
            st.push('(');

        if(s[i]==')')
        {
            if(st.empty())
                return 0;
            st.pop();
        }
    }

    if(s[len-1]=='(')
        st.push('(');
    if(s[len-1]==')')
    {
        if(st.empty())
            return 0;
        st.pop();
    }

    if(st.empty())
        return 1;
    return 0;
}

bool identifier(string s)
{
    int d = 0, len = s.size();
    for(int i=0; i<len; i++)
        if(isdigit(s[i]))
            d++;

    if(isalpha(s[0]) || s[0]=='_')
        return 1;
    else if(d == len)
        return 1;
    return 0;
}

int main()
{
    string s, tmp;
    cout<<"Enter a string: ";
    cin>>s;

    int len = s.size(), cnt = 0, ck = 1;
    for(int i=0; i<len && ck; i++)
    {
        if(isArithmetic(s[i]) || s[i]=='(' || s[i]==')')
        {
            if(!tmp.empty() && ck)
                ck = identifier(tmp);
            cnt++;
            tmp.clear();
        }
        else if(isalpha(s[i]) || isdigit(s[i]) || s[i]=='_')
        {
            tmp.push_back(s[i]);
            cnt++;
        }
    }

    if(!tmp.empty() && ck)
        ck = identifier(tmp);

    if(len != cnt || ck == 0)
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
