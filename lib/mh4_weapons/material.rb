class MH4Weapons::Material < MH4Weapons::Base
  self.filepath = "materials.yml"

  attr_reader :name

  def initialize name, value
    @name    = name
    @options = value
  end

  def rarity
    @options["rarity"]
  end
end
