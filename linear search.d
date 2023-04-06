import std.stdio;

int linearSearch(int[] arr, int key)
{
    int n = arr.length;

    for(int i = 0; i < n; i++)
    {
        if(arr[i] == key)
            return i;
    }

    return -1;
}

void main()
{
    int[] arr = [2, 3, 5, 7, 10, 15, 20, 25];
    int key, index;

    writeln("Enter a number to search: ");
    readf("%d", &key);

    index = linearSearch(arr, key);

    if(index == -1)
        writeln("Element not found");
    else
        writeln("Element found at index ", index);
}
