The problem is that you cannot call the value of an array 
like array[value]. You have to use the index number.

This could be fixed like:

  names.last = 'jody'

  OR

  names[3] = 'jody'