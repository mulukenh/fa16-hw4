class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def nickname
      @name[/^\w{0,4}/]
  end

  def birth_year
     current_year = Date.today.year
     current_year - @age.to_i
  end

  def introduction
    @name.to_s << " " << @age.to_s
  end

  def fib_number
    memo = []
    (0..@age.to_i).each do |i|
      memo[i] = i < 2 ? i : memo[i-1] + memo[i-2]
    end
    memo[@age.to_i]
  end
end
