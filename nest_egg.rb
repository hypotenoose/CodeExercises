def return_childs_est_nest_egg(my_age)
  childs_age = my_age / 2
  years_until_retirement = 65 - childs_age
  savings_balance = childs_age ** 2
  savings_balance * years_until_retirement
end

def return_number(a)
  ((a / 2)**2) * (65 - (a / 2))
end

puts return_childs_est_nest_egg(30)
puts return_childs_est_nest_egg(50)
puts return_number(30)
puts return_number(50)
