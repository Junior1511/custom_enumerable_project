module Enumerable
  # Your code goes here
  def my_each_with_index
    #returns enum if no block given
    return to_enum(:my_each_with_index) unless block_given?
    
    index = 0
    for i in self
      yield(i, index)
      index +=1 unless index > self.length
    end
    # should also return self at the end 
    self
  end

  def my_select
    #returns enum if no block given
    return to_enum(:my_select) unless block_given?
    
    array = []
    for i in self
      if yield(i) == true
        array << i
      end
    end
    #returns new array with truthy values
    array
  end
  
  def my_all?
    true unless self.include?(false, nil) 
  end
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
