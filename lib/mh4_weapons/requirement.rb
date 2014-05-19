class MH4Weapons::Requirement
  def self.parse items
    items.map do |item|
      self.new item["name"], item["quantity"]
    end
  end

  def initialize name, quantity
    @name     = MH4Weapons.materials.find{ |m| m.name == name }
    @quantity = quantity
  end
end
