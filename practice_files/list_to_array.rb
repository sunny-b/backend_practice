def list_to_array(list)
  return [list['value']] if list['next'].nil?
  arr = []
  
  arr << list['value'] << list_to_array(list['next'])

  arr.flatten
end




list = {'value'=>1, 'next'=>{'value'=>2, 'next'=>{'value'=>3, 'next'=>nil}}}

p list_to_array(list)