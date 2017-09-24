transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# puts "What is the value of the first transaction?"
# puts transactions.first
# puts "What is the value of the second transaction?"
# puts transactions[1]
# puts "What is the value of the fourth transaction?"
# puts transactions[3]
# puts "What is the value of the last transaction?"
# puts transactions[-1]
# puts "What is the value of the second from last transaction?"
# puts transactions[-2]
# puts "What is the value of the 5th from last transaction?"
# puts transactions[-5]
# puts "What is the value of the transaction with index 5?"
# puts transactions[5]
# puts "How many transactions are there in total?"
# puts transactions.size
# puts "How many positive transactions are there in total?"
# positive_transactions = transactions.select { |num| num > 0 }
# puts positive_transactions.size
# puts "How many negative transactions are there in total?"
# negative_transactions = transactions.reject { |num| num > 0 }
# puts negative_transactions.size
# puts "What is the largest withdrawal?"
# puts negative_transactions.min
# puts "What is the largest deposit?"
# puts positive_transactions.max
# puts "What is the small withdrawal?"
# puts negative_transactions.max
# puts "What is the smallest deposit?"
# puts positive_transactions.min
# puts "What is the total value of all the transactions?"
# puts transactions.inject(0) { |total, transaction| total += transaction }
# puts "If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?"
# puts transactions.inject(239_900) { |total, transaction| total += transaction }


# * How many negative transactions are there in total?
neg_count = 0
transactions.each do |num|
  if num < 0
    neg_count +=1
  end
end

puts "There are #{neg_count} negative transactions"
# * What is the largest withdrawal?
transactions.each do |num|
  largest_withdrawal = transactions[0]
  if num  < 0
    puts "The largest withdrawal is #{largest_withdrawal}"
    break
  end
end

# * What is the largest withdrawal?
new_transactions = []
new_transactions << transactions.sort

puts "The largest withdrawal is #{new_transactions[-1]}"
