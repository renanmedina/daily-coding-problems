```c
int longest_consecutive(int* nums, int numsSize) {
    if (numsSize == 0) return 0;
    unordered_set<int> num_set(nums, nums + numsSize);
    int max_length = 0;

    for (int num : num_set) {
        if (num_set.find(num - 1) == num_set.end()) {
            int current_num = num;
            int current_length = 1;

            while (num_set.find(current_num + 1) != num_set.end())
                current_num += 1, current_length++;

            max_length = max(max_length, current_length);
        }
    }

    return max_length;
}
```