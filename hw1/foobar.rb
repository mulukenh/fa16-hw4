class Foobar

  def self.baz(a)
    # Class method
    # Call with `Foobar.baz`
    a.map {|elem| elem.to_i + 2}.uniq
	.select{|elem| elem <= 10 && elem % 2 == 0}
	.inject(0){|sum, item| sum + item}
  end
end


