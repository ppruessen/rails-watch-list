# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'
require 'open-uri'
mov_url = 'https://image.tmdb.org/t/p/w500'
movies = URI.open('https://tmdb.lewagon.com/movie/top_rated').read
movies_json = JSON.parse(movies)
movies_array = movies_json['results']
movies_array.each do |movie|
  poster = movie['poster_path']
  movie = Movie.new(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{mov_url}#{poster}",
    rating: movie['vote_average']
  )
  movie.save!
end
