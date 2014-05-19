class MH4Weapons::Requirement
  def self.parse items
    items.map do |key, value|
      self.new key, value
    end
  end

  attr_accessor :name, :quantity

  def initialize name, quantity
    @name     = name #MH4Weapons::Material.all.find{ |m| m.name == name }
    @quantity = quantity
  end
end
