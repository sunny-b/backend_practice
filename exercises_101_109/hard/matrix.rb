def transpose(matrix)
  new_matrix = [[], [], []]
  rows = matrix.size
  columns = matrix[0].size

  rows.times do |row_idx|
    columns.times do |col_idx|
      new_matrix[row_idx] << matrix[col_idx][row_idx] 
    end
  end
  new_matrix
end 

def transpose!(matrix)
  1.upto(2) do |index|
    matrix[0][index], matrix[index][0] = matrix[index][0], matrix[0][index]
  end
  2.upto(2) do |index|
    matrix[1][index], matrix[index][1] = matrix[index][1], matrix[1][index]
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]