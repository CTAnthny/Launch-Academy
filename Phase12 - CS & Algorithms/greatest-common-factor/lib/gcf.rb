require 'prime'
class GreatestCF
  def prime_factors_of(number)
    prime_factors = []
    Prime.each(number) do |prime_number|
      if number % prime_number == 0
        prime_factors << prime_number
      end
    end
    return prime_factors
  end

  def compute(number1, number2)
    common_prime_factors = []
    prime_factors_one = prime_factors_of(number1)
    prime_factors_two = prime_factors_of(number2)

    prime_factors_one.reverse.each_with_index do |prime1, i|
      if prime1 == prime_factors_two.reverse[i]
        common_prime_factors << prime1
      end
    end

    factor1 = common_prime_factors.reverse[-1]
    factor2 = common_prime_factors.reverse[-2]

    if factor2
      return factor1 * factor2
    elsif factor1
      if (factor1 * factor1) > number1 || (factor1 * factor1) > number2
        return factor1
      else
        return factor1 * factor1
      end
    else
      return 1
    end
  end
end
