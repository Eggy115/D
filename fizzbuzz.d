import std.stdio;

void main()
{
    for(int i = 1; i <= 100; i++)
    {
        if(i % 3 == 0 && i % 5 == 0)
            writeln("FizzBuzz");
        else if(i % 3 == 0)
            writeln("Fizz");
        else if(i % 5 == 0)
            writeln("Buzz");
        else
            writeln(i);
    }
}
