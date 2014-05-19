class MH4Weapons::Recipe
  include MH4Weapons

  def self.all
    TwinSwordRecipe.all + []
  end
end
