import std.random;
import std.range;
import std.stdio;

void quick_sort(ref T[] arr) {
    if (arr.length <= 1) return;

    auto pivot = arr.front;
    auto less = arr[1..$].filter!(a => a <= pivot).array;
    auto greater = arr[1..$].filter!(a => a > pivot).array;

    quick_sort(less);
    quick_sort(greater);

    arr[] = less ~ [pivot] ~ greater;
}

void main() {
    auto arr = iota(1, 10).array;
    shuffle(arr);
    writeln("Before sorting: ", arr);

    quick_sort(arr);

    writeln("After sorting: ", arr);
}
