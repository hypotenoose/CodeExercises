def subsets(arr)

  return [[]] if arr.empty?
  last_el = arr.last
  arry = arr[0...-1]
  orig = subsets(arry)
  #mod = orig.dup

  #subs << subsets(arr)

  mod = []
  orig.dup.each { |subset| mod << subset + [last_el] }
  subs = mod + orig
end

#p subsets([1, 2, 3, 4, 5, 6])
p subsets([1, 2, 3])
