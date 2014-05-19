class MH4Weapons::Weapon < MH4Weapons::Base

  def recipes_deriving_to
    Recipe.all.select do |recipe|
      recipe.from == self
    end
  end

  def recipe_derived_from
    Recipe.all.find do |recipe|
      recipe.to == self
    end
  end

  def deriving_to
    recipes_deriving_to.map(&:to)
  end

  def derived_from
    recipe_derived_from.from
  end

  def ancestors
    if derived_from
      [self] + derived_from.ancestors
    else
      [self]
    end
  end

  def descendants
    if deriving_to.any?
      [self] + deriving_to.map(&:descendants).flatten
    else
      [self]
    end
  end

  def to_hash
    {
      name: name,
      from: derived_from
    }
  end
end
