class Definition
  @@definitions = []

  def initialize(definition_entry)
    @definition_entry = definition_entry
    @id = @@definitions.length().+1
  end

  def definition_entry
    @definition_entry
  end

  def id
    @id
  end

  define_singleton_method(:all) do
    @@definitions
  end

  def save
    @@definitions.push(self)
  end

  def delete
    @@definitions.delete(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  def id
    @id
  end

  define_singleton_method(:find) do |identification|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id() == identification.to_i
        found_definition = definition
      end
    end
    found_definition
  end

end
