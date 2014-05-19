class MH4Weapons::Recipe < MH4Weapons::Base
  attr_accessor :from, :to, :items

  def initialize hash
    @from  = MH4Weapons.all.find{ |w| w.name == hash["from"] }
    @to    = MH4Weapons.all.find{ |w| w.name == hash["to"] }
    @items = Item.parse hash["materials"]
  end

  class Item
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
end
