require 'benchmark'

def fibonacci(n)
  n < 2 ? n : fibonacci(n-1) + fibonacci(n-2)
end

# def fibonacciUR(n)
#   sequence = []
#   (0..n).each do |n|
#     if n < 2
#       sequence << n
#     else
#       sequence << sequence[-1] + sequence[-2]
#     end
#   end
#   sequence.last
# end
#
# Benchmark.bmbm do |x|
#   x.report("Fib: 144") { fibonacci(144) }
#   x.report("Fib: 6765") { fibonacci(6765) }
#   x.report("FibUR: 144") { fibonacciUR(144) }
#   x.report("FibUR: 6765") { fibonacciUR(6765) }
# end
