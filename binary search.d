import std.stdio;

int binarySearch(int[] arr, int low, int high, int key)
{
    if(low > high)
        return -1;

    int mid = (low + high) / 2;

    if(arr[mid] == key)
        return mid;
    else if(arr[mid] < key)
        return binarySearch(arr, mid + 1, high, key);
    else
        return binarySearch(arr, low, mid - 1, key);
}

void main()
{
    int[] arr = [2, 3, 5, 7, 10, 15, 20, 25];
    int key, index;

    writeln("Enter a number to search: ");
    readf("%d", &key);

    index = binarySearch(arr, 0, arr.length - 1, key);

    if(index == -1)
        writeln("Element not found");
    else
        writeln("Element found at index ", index);
}
