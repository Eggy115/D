import std.stdio;

int fibonacci(int n) {
    if (n < 2) {
        return n;
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

void main() {
    for (int i = 0; i < 10; i++) {
        writeln(fibonacci(i));
    }
}
