class Game < ActiveRecord::Base
  has_many :words

  def self.generate
    all_letters = self.random_pan.chars.uniq.join
    inner_letter = all_letters.chars.sample
    outer_letters = all_letters.gsub(inner_letter,"")

    game = self.create(inner_letter: inner_letter, outer_letters: outer_letters)

    words = self.generate_valid_words(inner_letter, all_letters)
    words.each do |word|
      game.words.create(word: word)
    end
  end

  def self.random_pan
    File.readlines("./data/validpangrams.txt").map do |word|
      word.gsub!(/[\r\n]+/,"")
    end.sample
  end

  def self.generate_valid_words(inner_letter, all_letters)
    words = []
    File.readlines("./data/validwords.txt").each do |word|
      word.gsub!(/[\r\n]+/,"")
      if self.valid_word?(word, inner_letter, all_letters)
        words << word
      end
    end
    words
  end

  def self.valid_word?(word, inner_letter, all_letters)
    word.include?(inner_letter) && word.chars.uniq.all? { |l| all_letters.chars.include?(l) }
  end

  def print_letters
    self.outer_letters[0..2].split("").join(" ") + " *#{self.inner_letter}* " + self.outer_letters[3..5].split("").join(" ")
  end

end