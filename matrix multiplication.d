import std.stdio;

template Matrix(size_t rows, size_t cols, T = double) {
    T[rows][cols] data;

    T[] opIndex(size_t i) { return data[i]; }
    const T[] opIndex(size_t i) const { return data[i]; }

    Matrix opBinary(string op: "*", alias B)(const B rhs) const {
        static if (B.length == cols) {
            Matrix!(rows, B.length, T) result;

            foreach (r; 0..rows) {
                foreach (c; 0..B.length) {
                    T sum = 0;
                    foreach (k; 0..cols) {
                        sum += data[r][k] * rhs[k][c];
                    }
                    result[r][c] = sum;
                }
            }

            return result;
        } else {
            static assert(false, "Matrix dimensions do not match");
        }
    }

    void opOpAssign(string op: "*", alias B)(const B rhs) {
        *this = this * rhs;
    }

    override string toString() const {
        string result = "[\n";
        foreach (r; 0..rows) {
            result ~= "  " ~ data[r].join(", ") ~ "\n";
        }
        result ~= "]";
        return result;
    }
}

void main() {
    auto a = Matrix!(3, 2, int)([ [1, 2], [3, 4], [5, 6] ]);
    auto b = Matrix!(2, 4, int)([ [7, 8, 9, 10], [11, 12, 13, 14] ]);

    writeln("a = ", a);
    writeln("b = ", b);
    writeln("a * b = ", a * b);
}
