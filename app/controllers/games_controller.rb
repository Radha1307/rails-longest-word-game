require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end

  def score
    @word = params[:query]
    @grid = params[:grid].split
    @in_the_grid = in_the_grid?(@word, @grid)
    @correct_word = correct_word?(@word)
   # @time =
   # @calcscore =
   # @message =
  end
  def in_the_grid?(word, grid)
    word.chars.all? do |letter|
      grid.count(letter) >= word.count(letter)
    end
  end

  def correct_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    data = JSON.parse(response.read)
    data["found"]
  end

end
