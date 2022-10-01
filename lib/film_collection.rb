require_relative "film_parser"

class FilmCollection
  extend FilmParser

  def initialize(collection)
    @collection = collection
  end

  def all_directors
    @collection.map(&:director).uniq
  end

  def all_directors_print
    all_directors.map.with_index(1) do |director, index|
      "#{index}: #{director}"
    end
  end

  def to_recomend(user_director)
    @collection.select { |film| film.director == user_director }.sample
  end
end
