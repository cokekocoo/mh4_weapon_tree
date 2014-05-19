class MH4Weapons::TwinSword < MH4Weapons::Base
  attr_reader :name

  def initialize name, value
    @name = name
    @options = value
  end

  def power
    @options["power"]
  end

  def slots_count
    @options["slots_count"]
  end

  def sharpness_length color
    @options["#{color}_length"]
  end

  def sharpness_percentage color
    sharpness_length(color).to_f / 72.to_f * 100
  end

  def recipes_derived_from
    MH4Weapons.twin_sword_recipes.find{ |r| r.to == self }
  end

  def recipes_deriving_to
    MH4Weapons.twin_sword_recipes.select{ |r| r.from == self }
  end

  def derived_from
    recipes_derived_from ? recipes_derived_from.from : nil
  end

  def deriving_to
    recipes_deriving_to.map(&:to)
  end

  private

  def collection
    MH4Weapons.twin_swords
  end
end
