require 'set'

class WordChainer

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end

  def one_letter_diff?(word1,word2)
    return false if word1.length != word2.length
    same_letters = 0
    word1.length.times do |i|
      same_letters += 1 if word1[i] == word2[i]
    end

    same_letters == word1.length - 1
  end

  def adjacent_words(word)
    result = []
    @dictionary.each do |w|
      result << w if one_letter_diff?(w, word)
    end
    result
  end


end

p WordChainer.new("dictionary.txt").adjacent_words('cat')
