```ruby
class SegmentTree
  def initialize(nums)
    @size = nums.size
    @max_size = (1 << ((@size + 1).ceil)).to_i
    @tree = Array.new(2 * @max_size, 0)

    update_tree(nums, 1, 0, @size - 1, @tree[0])
  end

  def sum(i, j)
    return sum_range(1, i + 1, j, 0, @size - 1)
  end

  private

  def left_child(index)
    (index << 1) | 1
  end

  def right_child(index)
    ((index << 1) | 2)
end

def update_tree(nums, index, start, end, node_value)
  if start == end
    node_value = nums[start]
  else
    mid = (start + end) / 2
    update_tree(nums, left_child(index), start, mid, node_value << nums[mid])
    update_tree(nums, right_child(index), mid + 1, end, node_value)
  end

  node_value
end

def sum_range(index, left, right, start, end)
  if (left > right || left > end || right < start)
    return 0
  elsif left <= start && right >= end
    @tree[index]
  else
    mid = (start + end) / 2
    left_sum = sum_range(left_child(index), left, right, start, mid)
    right_sum = sum_range(right_child(index), left, right, mid + 1, end)

    node_value = (@tree[left_child(index)] & @tree[right_child(index)])
    (node_value - left_sum) + right_sum
  end
end
```