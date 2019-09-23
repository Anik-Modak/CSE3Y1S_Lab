#include<iostream>
#include<bits/stdc++.h>

using namespace std;

char t,stk[100];
int top=-1,mx=99;
void push(char n)
{
    if(top==mx)
    {
        cout<<"stack Overflow\n";
    }
    else
    {
        top++;
        stk[top]=n;
    }
}
char pop()
{
    if(top==-1)
    {
        cout<<"stack Underflow\n";
    }
    else
    {
        t=stk[top];
        top--;
        return t;
    }
}

bool isoperator(char c)
{
    if(c=='+'||c=='-'||c=='*'||c=='/'||c=='^')
        return true;
    return false;
}

int priority(char a)
{
    int temp;
    if(a=='^')
        temp = 1;
    if(a=='*'|| a=='/')
        temp = 2;
    if(a=='+' || a=='-')
        temp = 3;
    return temp;
}

int main()
{
    string infix;
    char postfix[100];
    cin>>infix;
    infix[infix.size()]=')';
    push('(');
    int j=0;
    for(int i=0; i<=infix.size(); i++)
    {
        if(isdigit(infix[i]))
        {
            while(isdigit(infix[i]))
            {
                postfix[j]=infix[i];
                j++;
                i++;
            }
            i--;
            postfix[j]=',';
            j++;
        }
        if(isoperator(infix[i]))
        {
            if(stk[top]=='(')
            {
                push(infix[i]);
            }
            else
            {
                while(stk[top]!='(' && priority(stk[top])<=priority(infix[i]))
                {
                    postfix[j]=pop();
                    j++;
                    postfix[j]=',';
                    j++;
                }
                push(infix[i]);
            }
        }
        if(infix[i]=='(')
        {
            push(infix[i]);
        }
        if(infix[i]==')')
        {
            while(stk[top]!='(')
            {
                postfix[j]=pop();
                j++;
                postfix[j]=',';
                j++;
            }
            if(stk[top]=='(')
                pop();
        }
    }
    for(int i=0; i<j-1; i++)
    {
        cout<<postfix[i];
    }
    postfix[j-1]='\0';
    return 0;
}

