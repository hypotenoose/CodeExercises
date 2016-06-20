def bsearch(array, target)
  mid = array.length / 2
  if target == array[mid]
    mid
  elsif target > mid
    uppers = bsearch(array[(mid + 1)..-1], target)
    return nil if uppers == nil
    uppers += mid + 1
  else
    bsearch(array[0...mid], target)
  end
end

#puts bsearch([1,2,3,4,5,6,7,8,9], 8)
#puts bsearch([1,2,3,4,5,6,7,8,9], 2)
#p bsearch([1,2,3,4,5,6,7,8,9, 10, 11, 12, 13, 14, 15, 16], 15)
#puts bsearch([1,2,3,4,5,6,7,8,9], 5)
