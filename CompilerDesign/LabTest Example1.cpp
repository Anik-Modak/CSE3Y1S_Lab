#include<bits/stdc++.h>
using namespace std;

int main()
{
    string s;
    cin>>s;
    transform(s.begin(),s.end(),s.begin(),::tolower);

    if(s[0]>='a' && s[0]<='o' && s[2] != '_')
    {
        int cnt = 0, len = s.size();
        for(int i=0; i<len; i++)
        {
            if(isalpha(s[i]) || isdigit(s[i]))
                cnt++;
        }
        if(cnt==len)
            cout<<"Integer Variable"<<endl;
        else
            cout<<"Invalid Input"<<endl;
    }
    else if((s[0]=='0' && s[1]=='.') || (s[0]>='2' && s[0]<='9'))
    {
         int cnt1, cnt2, ck, len = s.size();
         cnt1 = cnt2 = ck = 0;

        for(int i=0; i<len; i++)
        {
            if(ck==0 && isdigit(s[i]))
                cnt1++;
            if(s[i]=='.')
                ck = 1;
            if(ck==1 && isdigit(s[i]))
                cnt2++;
        }

        if(cnt1+cnt2==len-1 && ck==1 && cnt2<=2)
            cout<<"Float Number"<<endl;
        else
            cout<<"Invalid Input"<<endl;
    }
    else if(s[0]>='c' && s[1]<='h'&& s[2]=='_')
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
    else if(s[0]=='0')
    {
        int cnt = 1, len = s.size();
        for(int i=1; i<len; i++)
        {
            if(s[i]=='0' || s[i]=='1')
                cnt++;
        }
        if(cnt == len)
            cout<<"Binary Number"<<endl;
        else
            cout<<"Invalid Input"<<endl;
    }
    else
        cout<<"Invalid Input"<<endl;

    return 0;
}
