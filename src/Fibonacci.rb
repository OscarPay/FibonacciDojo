require "matrix"
require "byebug"

class Fibonacci

  attr_accessor :memo

  def initialize
    @memo = Hash.new do |h, k|
      if k > 0
        h[k] = h[k-2] + h[k-1]
      else
        h[k] = h[k+2] - h[k+1]
      end
    end

    memo[-1] = 1
    memo[0] = 0
    memo[1] = 1
  end

  def call(position)
    memo[position]
    #iterative(position)
    #fib(position)
    # fib_matrix(position)
    #fib_times(position)
  end

  def iterative(n)
    i, j = 0, 1
    counter = 0
    while counter < n
      i, j = j, i + j
      counter += 1
    end
    i
  end

  def fib(n)
    return 0 if n == 0
    return 1 if n == 1 || n == -1

    x = (n<0 && n.even?) ? -1 : 1
    n = n<0 ? n*-1 : n

    s = Math.sqrt(5)
    gr = (1+s)/2
    return ((gr**n)/s).round*x
  end

  def fib_matrix(pos)
    # Fibonacci is calculate with matrix form
    # https://es.wikipedia.org/wiki/Sucesi%C3%B3n_de_Fibonacci#Forma_matricial
    #byebug
    return 0 if n == 0
    return 1 if n == 1 || n == -1
    result = Matrix[[0, 1], [1, 1]] ** pos
    result[0, 1].to_i
  end

  # [0, 1]
  # [1, 1]

  def fib_times(n)
    (n-1).times.each_with_object([0,1]) { |num, obj| obj << obj[-2] + obj[-1] }.last
  end

  # fn = fn+2 - fn-1
  # fib(0) = 0
  # fib(-1) = 1
  # fib(-2) = fib(0) - fib(-1) = 0 - 1 = -1
  # fib(-3) = fib(-1) - fib(-2) = 1 - -1 = 2
  # fib(-4) = fib(-2) - fib(-3) = -1 - 2 = -3
  # fib(-5) = fib(-3) - fib(-4) = 2 - -3 = 5
  # fib(-6) = fib(-4) - fib(-5) = -3 - 5 = -8


end