#include<bits/stdc++.h>
using namespace std;

int main()
{
    string s;
    cin>>s;
    transform(s.begin(),s.end(),s.begin(),::tolower);

    if(s[0]>='i' && s[0]<='n')
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
    else if(s[0]>='1' && s[0]<='9')
    {
        int cnt = 0, len = s.size();
        for(int i=0; i<len; i++)
            if(isdigit(s[i]))
                cnt++;

        if(cnt==len)
        {
            if(cnt<5)
                cout<<"ShortInt Number"<<endl;
            else
                cout<<"LongInt Number"<<endl;
        }
        else
            cout<<"Invalid Input"<<endl;
    }
    else
        cout<<"Invalid Input"<<endl;
    return 0;
}
