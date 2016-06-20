class Array
  def my_each(&prc)
    count = 0
    while count < length
      prc.call(self[count])
      count += 1
    end
  end

  def my_select(&prc)
    blank_array = []
    self.my_each do |val|
      blank_array << val if prc.call(val) == true
    end
    blank_array
  end

  def my_reject(&prc)
    blank_array = []
    self.my_each do |val|
      blank_array << val if prc.call(val) == false
    end
    blank_array
  end

  def my_any?(&prc)
    self.my_each do |val|
      return true if prc.call(val) == true
    end
      false
  end

  def my_all?(&prc)
    self.my_each do |val|
      return false if prc.call(val) == false
    end
    true
  end

  def my_flatten
    old_array = self
    while old_array.my_any? { |x| x.class == Array}
      i = 0
      new_array = []
      while i < old_array.length
        if old_array[i].class == Fixnum
          new_array << old_array[i]
        end
        if old_array[i].class == Array
          old_array[i].my_each do |x|
            new_array << x
          end
        end
      i += 1
      end
      old_array = new_array
    end
    new_array
  end

  def my_zip(*args)
    main_array = []
    self.each do |i|
      main_array << [i]
    end

    args.each do |arg|
      c = 0
      while c < main_array.count
        main_array[c] << arg[c]
        c += 1
      end
    end
    main_array
  end

  def my_rotate(num = 1)
    new_array = []
    while num >= self.length
      num -= self.length
    end
    while new_array.length < self.length
      new_array << self[num]
      if num < (self.length - 1)
        num += 1
      else
        num = 0
      end
    end
    new_array
  end

  def alternate_rotate(num = 1)
    num -= self.length while num >= self.length
    shifted = self[num...self.length]
    f_shifted = self[0...num]
    result = shifted + f_shifted
  end

  def my_join(sep = ", ")
    new_string = ""
    self.map { |el| new_string += (el + sep)}
    sep.length.times do
      new_string = new_string.chop
    end
    new_string
  end

  def my_reverse
    count = self.length - 1
    new_array = []
    while count >= 0
      new_array << self[count]
      count -= 1
    end
    new_array
  end

end


a = [ "a", "b", "c", "d" ]
p a.alternate_rotate        #=> ["b", "c", "d", "a"]
p a.alternate_rotate(2)      #=> ["c", "d", "a", "b"]
p a.alternate_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.alternate_rotate(15)     #=> ["d", "a", "b", "c"]
