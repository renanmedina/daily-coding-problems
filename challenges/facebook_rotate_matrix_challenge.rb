=begin
This problem was asked by Facebook.
Given an N by N matrix, rotate it by 90 degrees clockwise.
For example, given the following matrix:
[[1, 2, 3],
 [4, 5, 6],
 [7, 8, 9]]
you should return:
[[7, 4, 1],
 [8, 5, 2],
 [9, 6, 3]]
Follow-up: What if you couldn't use any extra space?
=end

def rotate_matrix_90deg_clockwise(matrix)
  matrix_size = matrix.size

  (0...matrix_size).each do |i|
    inner_start = i + 1
    (inner_start...matrix_size).each do |j|
      # transpose positions
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end

  matrix.each(&:reverse!)
end

samples = [
  {
    matrix: [
      [1, 2, 3], # [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
      [4, 5, 6],
      [7, 8, 9]
    ],
  },
  {
    matrix: [
      [10, 11, 12], # [[16, 13, 10], [17, 14, 11], [18, 15, 12]]
      [13, 14, 15],
      [16, 17, 18]
    ],
  }
]

samples.each do |input|
  input_matrix = input[:matrix]
  answer = rotate_matrix_90deg_clockwise(input_matrix)
  puts "Rotating matrix #{input_matrix} 90 degrees clockwise: #{answer}"
end