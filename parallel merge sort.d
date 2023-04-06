import std.parallelism;

void parallel_merge_sort(ref T[] arr) {
    auto n = arr.length;
    if (n <= 1) return;

    auto middle = n / 2;
    auto left = arr[0..middle];
    auto right = arr[middle..$];

    if (left.length > 1) {
        auto f = task!parallel_merge_sort(left);
        parallel_merge_sort(right);
        f.join();
    } else {
        parallel_merge_sort(right);
    }

    auto l = left.length, r = right.length;
    auto i = 0, j = 0, k = 0;

    while (i < l && j < r) {
        if (left[i] <= right[j]) {
            arr[k++] = left[i++];
        } else {
            arr[k++] = right[j++];
        }
    }

    while (i < l) {
        arr[k++] = left[i++];
    }

    while (j < r) {
        arr[k++] = right[j++];
    }
}

void main() {
    auto arr = [10, 5, 2, 7, 3, 8, 1, 6, 4, 9];
    writeln("Before sorting: ", arr);

    parallel_merge_sort(arr);

    writeln("After sorting: ", arr);
}
