module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return if empty?

        tail = self
        until tail.empty?
          h, * tail = tail
          yield(h)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        return if empty?

        new_array = MyArray.new
        my_reduce(new_array) { |result, element| result << yield(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new
        compact_array = my_reduce(new_array) do |result, element|
          element.nil? ? result : result << element
        end
        compact_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil)
        tail = self
        until tail.empty?
          h, * tail = tail
          accumulator = !accumulator.nil? ? yield(accumulator, h) : h
        end
        accumulator
      end
    end
  end
end
