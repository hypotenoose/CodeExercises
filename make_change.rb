def make_change(amount, [*coin_den])
  result = []
  coins = []
  return result if amount == 0
  coin_den.each {|coin| coins << coin}

  if amount >= coins[0]
    result << coins[0]
    amount -= coins[0]
  elsif amount >= coins[1]
    result << coins[1]
    amount -= coins[1]
  else
    result << coins[2]
    amount -= coins[2]
  end



  result += make_change(amount)


  result
end
#[25, 25, 10, 5, 1, 1, 1]
p make_change(14, [10, 7, 1])
