def bubble_sort(array)

  sorted = false

  while !sorted

    sorted = true

    (array.length - 1).times do |i|

      if array[i + 1] < array[i]
         array[i], array[i + 1] = array[i+ 1], array[i]
         sorted = false
      end
    
    end
  
  end


  return array

end


def bubble_sort_by(array)

sorted = false

  while !sorted

    sorted = true

    (array.length - 1).times do |i|

      if yield(array[i], array[i + 1]) > 0
         array[i], array[i + 1] = array[i+ 1], array[i]
         sorted = false
      end
    
    end
  
  end


  return array

end



  bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
  end
# ["hi", "hey", "hello"]
