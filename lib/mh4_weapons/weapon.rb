class MH4Weapons::Weapon < MH4Weapons::Base
  def deriving_to
    Recipe.all.select do |recipe|
      recipe.from == self
    end.map(&:to)
  end

  def derived_from
    Recipe.all.find do |recipe|
      recipe.to == self
    end.from
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
