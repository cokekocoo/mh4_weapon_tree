class MH4Weapons::Attr
  def self.parse attrs
    attrs.map do |key, value|
      self.new key, value
    end
  end

  attr_accessor :name, :value

  def initialize name, value
    @name, @value = name, value
  end
end
