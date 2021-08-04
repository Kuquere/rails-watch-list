require 'open-uri'
require 'json'

puts "borrando pelis"
Movie.destroy_all
puts "creando pelis "

url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |y|
  movies = JSON.parse(open("#{url}?page=#{y + 1}").read)['results']
  
  movies.each do |movie|
    poster = "https://image.tmdb.org/t/p/original"
      Movie.create(
        title: movie['overview'],
        overview: movie['overview'],
        rating: movie['vote_average'],
        poster_url: "#{poster}#{movie['backdrop_path']}"
      )
  end
end

  puts "creado"
