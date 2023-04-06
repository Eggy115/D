import std.stdio;

ulong factorial(ulong n)
{
    if(n == 0 || n == 1)
        return 1;
    else
        return n * factorial(n - 1);
}

void main()
{
    ulong num, result;

    writeln("Enter a number: ");
    readf("%lu", &num);

    result = factorial(num);

    writeln("Factorial of ", num, " is ", result);
}
