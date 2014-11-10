require 'set'

class WordChainer

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end

  def adjacent_words(word)
    result = []
    word.length.times do |i|
      ('a'..'z').each do |letter|
        temp_word = word.dup
        temp_word[i] = letter
        next if temp_word == word
        result << temp_word if @dictionary.include?(temp_word)
      end
    end
    result
  end

end

p WordChainer.new("dictionary.txt").adjacent_words('cat')
