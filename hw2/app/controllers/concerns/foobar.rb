class Foobar
  # ENTER CODE FOR Q2 HERE
  def initialize(param)
  	@param = param
  end

  def bar (*args)
  	args[0].to_s <<  @param << args[1][:sat].to_s
  end
end
