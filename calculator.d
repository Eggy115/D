import std.stdio;

void main()
{
    double num1, num2, result;
    char op;

    writeln("Enter the first number: ");
    readf("%lf", &num1);

    writeln("Enter the second number: ");
    readf("%lf", &num2);

    writeln("Enter the operator (+, -, *, /): ");
    readf("%c", &op);

    switch(op)
    {
        case '+': result = num1 + num2; break;
        case '-': result = num1 - num2; break;
        case '*': result = num1 * num2; break;
        case '/': result = num1 / num2; break;
        default: writeln("Invalid operator"); return;
    }

    writeln("Result: ", result);
}
