class MH4Weapons::TwinSwordRecipe < MH4Weapons::Base
  self.filepath = "twin_sword_recipes.yml"

  attr_accessor :from, :to, :items

  def initialize hash
    @from  = MH4Weapons.all.find{ |w| w.name == hash["from"] }
    @to    = MH4Weapons.all.find{ |w| w.name == hash["to"] }
    @items = Requirement.parse hash["materials"]
  end
end
