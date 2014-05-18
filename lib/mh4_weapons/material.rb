class MH4Weapons::Material < MH4Weapons::Base
  attr_reader :name

  def initialize name, value
    @name = name
    @options = value
  end

  def rarity
    @options["rarity"]
  end

  private

  def collection
    MH4Weapons.materials
  end
end
