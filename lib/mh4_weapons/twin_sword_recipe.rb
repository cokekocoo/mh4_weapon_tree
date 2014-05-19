class MH4Weapons::TwinSwordRecipe < MH4Weapons::Base
  self.filepath = "twin_sword_recipes.yml"

  attr_accessor :from, :to, :items

  def initialize key, value
    @to    = MH4Weapons.all.find{ |w| w.name == key }
    @from  = MH4Weapons.all.find{ |w| w.name == value["from"] }
    @items = Requirement.parse value["materials"]
  end
end
