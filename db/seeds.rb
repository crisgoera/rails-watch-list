# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

url = "http://tmdb.lewagon.com/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200"
movies = HTTParty.get(url)['results']
movies.each do |movie|
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  Movie.create!(title: movie['original_title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: poster_url)
end
