class MH4Weapons::Recipe
  include MH4Weapons

  def self.all
    Recipes::TwinSword.all + []
  end
end
