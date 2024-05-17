=begin
Good morning! Here's your coding interview problem for today.
This problem was asked by Amazon.
Given a N by M matrix of numbers, print out the matrix in a clockwise spiral.
For example, given the following matrix:
[[1,  2,  3,  4,  5],
 [6,  7,  8,  9,  10],
 [11, 12, 13, 14, 15],
 [16, 17, 18, 19, 20]]
You should print out the following:
1
2
3
4
5
10
15
20
19
18
17
16
11
6
7
8
9
14
13
12
=end
def print_clockwise_spiral(input:)
  top_row = 0
  bottom_row = input.count - 1
  left_column = 0
  right_column = input.first.count - 1

  while top_row <= bottom_row && left_column <= right_column
    (left_column..right_column).each do |i|
      puts input[top_row][i]
    end
    top_row += 1

    (top_row..bottom_row).each do |i|
      puts input[i][right_column]
    end
    right_column -= 1

    if top_row <= bottom_row
      right_column.downto(left_column).each do |i|
        puts input[bottom_row][i]
      end
      bottom_row -= 1
    end

    if left_column <= right_column
      bottom_row.downto(top_row).each do |i|
        puts input[i][left_column]
      end
      left_column += 1
    end
  end
end

samples = [
  [
    [1,  2,  3,  4,  5],
    [6,  7,  8,  9,  10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20]
  ],
  [
    [21, 22, 23, 24, 25, 26, 27, 28, 29, 30],
    [31, 32, 33, 34, 35, 36, 37, 38, 39, 40],
    [41, 42, 43, 44, 45, 46, 47, 48, 49, 50],
    [51, 52, 53, 54, 55, 56, 57, 58, 59, 60]
  ],
]

samples.each do |sample|
  print_clockwise_spiral(input: sample)
  puts '-------------------------------------------------------'
end