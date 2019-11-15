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

    