class Film
  attr_reader :film_name, :director, :year

  def initialize(film_name, director, year)
    @film_name = film_name
    @director = director
    @year = year
  end

  def to_s
    "#{director} - #{film_name} (#{year})"
  end
end
