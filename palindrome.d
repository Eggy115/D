import std.stdio;

bool isPalindrome(string str)
{
    int len = str.length;

    for(int i = 0; i < len / 2; i++)
    {
        if(str[i] != str[len - i - 1])
            return false;
    }

    return true;
}

void main()
{
    string str;

    writeln("Enter a string: ");
    readf("%s", &str);

    if(isPalindrome(str))
        writeln(str, " is a palindrome");
    else
        writeln(str, " is not a palindrome");
}
