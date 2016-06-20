def range_iterative(start, finish)
  array = (start...finish).to_a
  array.shift!
  array
end

def range_recursive(startpoint, endpoint)
  return [] if endpoint - startpoint < 2
  [startpoint + 1] + range_recursive(startpoint + 1, endpoint)
end

def exponent_one(base, power)
  return 1 if power == 0
  base * exponent_one(base, power - 1)
end


def exponent_two(base, power)
  sq_root = exponent_two(base, power/2)
  weird_root = ((power-1) /2)

  return 1 if power == 0
  return base if power == 1
  if power % 2 == 0
    sq_root * sq_root
  else
    base * exponent_two(base, weird_root * weird_root)
  end
end
