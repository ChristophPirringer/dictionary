#########################################
#############__Needed-Gems__#############
#########################################

require("rspec")
require("word")
require("definition")
require("pry")


########################################
#############__Word-Class__#############
########################################

describe(Word) do

  before() do
    Word.clear()
    Definition.clear()
  end

  describe(".all") do
    it("returns the empty array of @@words") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("tests for the existance of a saved test_word") do
      test_word = Word.new("BadWolf")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe("#delete") do
    it("tests for the removal of a saved test_word") do
      test_word = Word.new("BadWolf")
      test_word.save()
      test_word.delete()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("tests for the empty array of @@words after saving a test_word and then clearing it") do
      test_word = Word.new("BadWolf")
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the word-entry in the @@words-array, which as the first entry is 1.") do
      test_word = Word.new("BadWolf")
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("finds the word-entry through its id-number") do
      test_word = Word.new("BadWolf")
      test_word.save()
      test_word2 = Word.new("CleverBoy")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe("#definitions") do
    it("returns an empty array of definitions for an entry in the @@words-array") do
      test_word = Word.new("BadWolf")
      expect(test_word.definitions()).to(eq([]))
    end
  end


  describe("#add_definition") do
    it("adds a new definition to an entry in the @@words-array") do
      test_word = Word.new("BadWolf")
      test_word.save()
      test_definition = Definition.new("Rose Tyler")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

end



##############################################
#############__Definition-Class__#############
##############################################

describe(Definition) do

    before() do
      Word.clear()
      Definition.clear()
    end

  describe(".all") do
    it("returns the empty array of @@definitions") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("tests for the existance of a saved test_definition") do
      test_definition = Definition.new("Rose Tyler")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it("tests for the empty array of @@definitions after saving a test_definition and then clearing it") do
      test_definition = Definition.new("Rose Tyler")
      test_definition.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the definition-entry in the @@definitions-array, which as the first entry is 1.") do
      test_definition = Definition.new("Rose Tyler")
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("finds the definition-entry through its id-number") do
      test_definition = Definition.new("Rose Tyler")
      test_definition.save()
      test_definition2 = Definition.new("Ender of Daleks")
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end

end
