def tickets1(people)
  # Your solution here...
  # keep track of what we have
  # hash
  # for each ticket
  # take in the money
  # see if they need change
  # if yes we check if we have change
  # what kind of change do we give?
  # subtract

  cash = Hash.new(0)
  people.each do |bill|
    cash[bill] += 1
    next if bill == 25

    if bill == 50
      return "NO" if cash[25] < 1

      cash[25] -= 1
    else
      if cash[50] >= 1 && cash[25] >= 1
        cash[50] -= 1
        cash[25] -= 1
      elsif cash[25] >= 3
        cash[25] -= 3
      else
        return "NO"
      end
    end
  end
  return "YES"
end

p tickets([25, 25, 50]) == 'YES'
p tickets([25, 100]) == 'NO'
p tickets([25, 25, 50, 50, 100]) == 'NO'
