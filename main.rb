require_relative "lib/film"
require_relative "lib/film_collection"

#Получаем список фильмов в виде объектов
film_collection = FilmCollection.from_rottentomatoes
ALL_DIRECTORS_RANGE = (1..film_collection.all_directors.size)
#Выводим всех режиссеров
puts "Program 'Film to watch'"
puts film_collection.all_directors_print

user_number = nil
until ALL_DIRECTORS_RANGE.include?(user_number)
  puts "Which film director do you want to watch? Enter the director's number from the list:"
  user_number = $stdin.gets.to_i
end

user_director = film_collection.all_directors[user_number - 1]
#Получаем фильм режиссера.Если фильмов несколько - отбираем случайный
recommended_film = film_collection.to_recomend(user_director)

puts "I recommend watching it tonight:"
puts recommended_film
