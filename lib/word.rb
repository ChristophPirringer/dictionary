class Word
  @@words = []

  def initialize(word_entry)
    @word_entry = word_entry
    @id = @@words.length().+1
    @definitions = []
  end

  def word_entry
    @word_entry
  end

  def id
    @id
  end

  def definitions
    @definitions
  end

  define_singleton_method(:all) do
    @@words
  end

  def save
    @@words.push(self)
  end

  def delete
    @@words.delete(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  def id
    @id
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id() == identification.to_i
        found_word = word
      end
    end
    found_word
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

end
