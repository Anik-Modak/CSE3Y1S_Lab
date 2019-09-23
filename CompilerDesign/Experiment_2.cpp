//Anik_Modak
#include<bits/stdc++.h>
using namespace std;

int main()
{
    string str;
    getline(cin, str);

    string vow, con;
    for(int i=0; i<str.size(); i++)
    {
        if(isalpha(str[i]))
        {
            char ch = str[i];
            if(isupper(ch))
                ch = ch + 32;

            if(ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u')
                vow.push_back(str[i]);
            else
                con.push_back(str[i]);
        }
        else
            str[i] = ' ';
    }

    //(a)
    cout<<"The number of vowels: "<<vow.size()<<endl;
    cout<<"The number of consonant: "<<con.size()<<endl;

    //(b)
    cout<<vow<<endl;
    cout<<con<<endl;

    //(c)
    vector<string> vo, co;
    stringstream s(str);
    while(s>>str)
    {
        char ch = str[0];
        if(isupper(ch))
            ch = ch + 32;

        if(ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u')
            vo.push_back(str);
        else
            co.push_back(str);
    }

    cout<<"Vowel words are: ";
    for(int i=0; i<vo.size(); i++)
        cout<<vo[i]<<" ";
    cout<<endl;

    cout<<"Consonant words are: ";
    for(int i=0; i<co.size(); i++)
        cout<<co[i]<<" ";
    cout<<endl;

    return 0;
}
