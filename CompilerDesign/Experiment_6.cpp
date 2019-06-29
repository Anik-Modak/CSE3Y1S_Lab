#include<bits/stdc++.h>
using namespace std;

int main()
{
    string s;
    cin>>s;
    transform(s.begin(),s.end(),s.begin(),::tolower);

    if((s[0]>='c' && s[1]<='h') && s[2]=='_')
    {
        int cnt = 3, len = s.size();
        for(int i=3; i<len; i++)
        {
            if(isalpha(s[i]) || isdigit(s[i]))
                cnt++;
        }

        if(cnt==len)
            cout<<"Character Variable"<<endl;
        else
            cout<<"Invalid Input"<<endl;
    }
    else if((s[0]>='b' && s[1]<='n') && s[2]=='_')
    {
        int cnt = 3, len = s.size();
        for(int i=3; i<len; i++)
        {
            if(isalpha(s[i]) || isdigit(s[i]))
                cnt++;
        }

        if(cnt==len)
            cout<<"Binary Variable"<<endl;
        else
            cout<<"Invalid Input"<<endl;
    }
    else
    {
        int cnt = 0, len = s.size();
        for(int i=0; i<len; i++)
        {
            if(s[i]=='0' || s[i]=='1')
                cnt++;
        }

        if(cnt==len)
            cout<<"Binary Number"<<endl;
        else
            cout<<"Invalid Input"<<endl;
    }
    return 0;
}

