module Enumberable
    def my_each(array)

        finally = []

        i = 0
        while i < array.length
            finally << yield(array[i])
            i += 1
        end

        return finally

    end

    # my_each([1,2,3,4]) do |x|
    #   x * 2
    # end

    def my_each_with_index(array)

        finally = []

        i = 0
        while i < array.length
            finally << yield(array[i], i)
            i += 1
        end

        return finally

    end

    # my_each_with_index([1,2,3,4]) do |x, i|
    #   if i > 2
    #     x * 2
    #   else
    #     x
    #   end
    # end


    def my_select(array)

        finally = []

        i = 0
        while i < array.length

          if yield(array[i])
            finally << array[i]
          end
        
          i += 1
        
        end

        return finally
    end


    # my_select([1,2,3,4]) do |n|
    #   n > 2
    # end

    def my_all?(array)

        finally = true

        i = 0
        while i < array.length

          if !yield(array[i])
            finally = false
          end
        
          i += 1
        
        end

        return finally
    end


    # my_all?([1,2,3,4]) do |n|
    #   n > 0
    # end

    def my_any?(array)

        i = 0
        while i < array.length

          if yield(array[i])
            return true
          end
        
          i += 1
        
        end
        return false 
    end

    # my_any?([1,2,3,4]) do |n|
    #   n * 2 > 10
    # end


    def my_none?(array)
        
        finally = true

        i = 0
        while i < array.length

          if yield(array[i])
            finally = false
          end
        
          i += 1
        
        end

        return finally
    end


    # my_none?([1,2,3,4]) do |n|
    #   n.is_a? String
    # end

    def my_count(array)
        
        finally = 0

        i = 0
        while i < array.length

          if yield(array[i])
            finally += 1
          end
        
          i += 1
        
        end

        return finally
    end

    # my_count([1,2,3,4]) do |n|
    #   n * 2 > 2
    # end

    # def my_map(array)
    #     finally = []

    #     i = 0
    #     while i < array.length

    #       finally << yield(array[i])
    #       i += 1
        
    #     end

    #     return finally
    # end

    # my_map([1,2,3,4]) do |n|
    #   n**2
    # end

    def my_inject(array)
        finally = array[0]

        i = 0
        while i < array.length

          finally = yield(finally, array[i])
          i += 1
        
        end

        return finally

    end

    # my_inject([1,2,3,4]) do |result, n|
    #   result * n
    # end

    def multiply_els(array)

        return my_inject(array) do |result, n| 
            result * n
        end

    end

    # multiply_els([2,4,5])

    # def my_map(array, prc)
    #     finally = []

    #     i = 0
    #     while i < array.length

    #       finally << prc.call(array[i])
    #       i += 1
        
    #     end

    #     return finally
    # end

    # prc = Proc.new { |n| n**2 }

    # my_map([1,2,3,4], prc)


        def my_map(array, prc=nil)
        finally = []

        i = 0
        while i < array.length

          if block_given?
             yield(array[i])
          else
            finally << prc.call(array[i])
          end

          i += 1
        
        end

        return finally
    end

    prc = Proc.new { |n| n**2 }

    # my_map([1,2,3,4], prc)

    