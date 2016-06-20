class Array
  def deep_dup
    new_array = []
    self.each_with_index do |el, i|
      unless el.is_a?(Array)
        new_array << el #+ el.next
      else
        new_array << (el.deep_dup)
      end
    end
    new_array
  end
end

  def fibonacci_recursive(n)

    return [1] if n == 1
    return [1,1] if n == 2
    existing_fibs = fibonacci_recursive(n-1)
    existing_fibs << (existing_fibs[-1] + existing_fibs[-2])
    #fibonacci_recursive(n-1).push(≈ + )
  end

def fibonacci_iterative(n)
  fibs = [1, 1]

  if n <= 2
    (2 - n).times {fibs.pop}
  end

  c = 2
  while fibs.length < n && n > 2
    fibs << (fibs[c-1] + fibs[c-2])
    c += 1
  end
  fibs
end

p fibonacci_recursive(11)
