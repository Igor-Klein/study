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
          film['name'].to_s.include?('и') && film['rating_kinopoisk'].to_f >= threshold && !film['rating_kinopoisk'].nil?
        end
        array_count_in_string = new_arr_select.map { |film| film['name'].count('и') }
        array_count_in_string.reduce(:+)
      end
    end
  end
end
