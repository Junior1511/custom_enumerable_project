module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    #returns enum if no block given
    return to_enum(:my_each) unless block_given?
    #should execute whatever block given 
    #and the parameter is i and user should be able to use it 
    for i in self
      yield(i)
    end
    # should also return self at the end 
    self
  end
end
