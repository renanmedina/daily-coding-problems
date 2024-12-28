```ruby
class RandomizedSet {
    def initialize()
        @nums = []
        @index_map = {}
    end

    def insert(val)
        return false if @index_map.key?(val)
        @nums << val
        @index_map[val] = @nums.size - 1
        return true
    end

    def remove(val)
        return false if !@index_map.key?(val)
        index = @index_map[val]
        last_element, *tmp_nums = @nums
        @nums[index] = last_element
        @index_map[last_element] = index
        @nums.pop if val == last_element
        return true if @nums.size == index + 1
        @index_map.delete(val)
        return false
    end

    def random()
        index = rand(@nums.size)
        return @nums[index]
    end
}
```