module Exercise
  module Fp
    class << self
      # Посчитать средний рейтинг фильмов по версии кинопоиска у которых две или больше стран
      # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        new_arr_select = films.select do |film|
          film['country'].to_s.include?(',') && film['rating_kinopoisk'].to_f.positive?
        end
        new_arr_map = new_arr_select.map { |film| film['rating_kinopoisk'].to_f }

        summa = new_arr_map.reduce(:+)
        summa / new_arr_map.length
      end

      def chars_count(films, threshold)
        new_arr_select = films.select do |film|
          film['name'].to_s.include?('и') && film['rating_kinopoisk'].to_f >= threshold
        end
        array_of_strings = new_arr_select.map { |film| film['name'].to_s }

        def count_string(str)
          new_arr = str.to_s.chars
          new_arr_chars = new_arr.select { |item| item == 'и' }
          new_arr_chars.length.to_i
        end
        array_of_number_of_characters = array_of_strings.map { |arr1| count_string(arr1) }
        array_of_number_of_characters.reduce(:+)
      end
    end
  end
end
