```dart
List<List<int>> subarraySum(int[] nums, int k) {
  Map<int, int> map = {0: -1};
  int sum = 0;
  List<List<int>> result = [];

  for (int i = 0; i < nums.length; i++) {
    sum += nums[i];
    if (map.containsKey(sum - k)) {
      List<int> subarray = List.from([map[sum - k] + 1, i]);
      if (!result.contains(subarray)) result.add(subarray);
    }
    map[sum] = i;
  }

  return result;
}
```