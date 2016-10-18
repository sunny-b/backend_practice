require 'pry'

def transpose(matrix)
  rows = matrix.size
  columns = matrix[0].size
  new_matrix = []
  
  columns.times do
    new_matrix << []
  end
  
  rows.times do |row_idx|
    columns.times do |col_idx|
      new_matrix[col_idx] << matrix[row_idx][col_idx]
    end
  end
  new_matrix
end 


puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]