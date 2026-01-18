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
    my_each do |i|
      array << i if yield(i)
    end
    #returns new array with truthy values
    array
  end
 
  def my_all?
    for i in self
      if block_given?
        # If there's a block, ONLY check the result of the yield
        result = yield(i)
        return false if result == false || result == nil
      else
        # If there's NO block, check the element itself
        return false if i == false || i == nil
      end
    end
    true # If we finish the loop without returning false, it's true
  end

  def my_any?
    for i in self
      if block_given?
        result = yield(i)
        # Check if result is truthy (not nil and not false)
        return true if result != false && result != nil
      else
        # Check if element itself is truthy
        return true if i != false && i != nil
      end
    end
    false
  end

  def my_none?
    for i in self
      if block_given?
        result = yield(i)
        return false if result != false && result != nil
      else
        return false if i != false && i != nil
      end
    end
    true
  end

  def my_count
    count = 0
    for i in self
      if block_given?
        result = yield(i)
        if result != false && result != nil
          count += 1 
        end
      else 
        count += 1
      end
    end
    count
  end

  def my_map
    new_array = []
    for i in self
      unless block_given?
        return to_enum(:my_map)
      else
        new_array << yield(i)
      end


    end
    new_array
  end

  def my_inject(initial_value=nil)
    # returns enum if no block given
    return to_enum(:my_inject) unless block_given?

    if initial_value != nil
      acumulator = initial_value
      for i in self
        acumulator = yield(acumulator, i)
      end
      acumulator
    else
      acumulator = self[0]
      for i in self[1..-1]
        acumulator = yield(acumulator, i)
      end
      acumulator
    end
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
