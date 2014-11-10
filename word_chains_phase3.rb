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

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source => nil}
    until @current_words.empty?
      new_current_words = explore_current_words
      puts "\n"
      @current_words = new_current_words
    end
    nil
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |word|
      adj_words = adjacent_words(word)
      adj_words.each do |adj_word|
        next if @all_seen_words.include?(adj_word)
        new_current_words << adj_word
        @all_seen_words[adj_word]= word
      end
    end
    new_current_words.each do |word|
      puts word + " came from " + @all_seen_words[word]
    end
    new_current_words
  end

end

#p WordChainer.new("dictionary.txt").adjacent_words('cat')

WordChainer.new("dictionary.txt").run('cat','zebra')
