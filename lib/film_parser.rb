require "net/http"
require "uri"
require "nokogiri"
require "open-uri"

module FilmParser
  extend self

  ROTTENTOMATOES_URL = "https://editorial.rottentomatoes.com/guide/popular-movies/"

  def from_rottentomatoes
    #parsing every film block info to film objects
    doc = Nokogiri::HTML(URI.open(ROTTENTOMATOES_URL))

    collection = doc.css(".countdown-item").map do |film_block|
      name = film_block.css(".article_movie_title div h2 a").first.text
      year = film_block.css(".article_movie_title div h2 .start-year").first.text
      director = film_block.css(".director a").first.text

      Film.new(name, director.to_s, year.tr("()", "").to_s.to_i)
    end

    FilmCollection.new(collection)
  end
end
