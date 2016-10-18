require 'pry'

def rotate90(matrix)
  rows = matrix.size
  columns = matrix.first.size
  new_matrix = []

  columns.times { new_matrix << [] }

  columns.times do |col_idx|
    rows.times do |row_idx|
      new_matrix[col_idx] << matrix[(rows-1) - row_idx][col_idx]
    end
  end

  new_matrix
end

def rotate(matrix, degrees)
  cycles = degrees / 90
  cycles.times do
    matrix = rotate90(matrix)
  end
  matrix
end

0,2 = 2,0

0,0 = 2,2


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
