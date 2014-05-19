module MH4Weapons
  def self.yaml_basepath
    Rails.root + "lib/yaml/"
  end

  def self.map_yaml filename
    YAML.load_file(self.yaml_basepath + filename).map do |key, value|
      yield key, value
    end
  end

  def self.twin_swords
    @@twin_swords ||= self.map_yaml "twin_swords.yml" do |key, value|
      TwinSword.new key, value
    end
  end

  def self.all
    self.twin_swords
  end

  def self.materials
    @@materials ||= self.map_yaml "materials.yml" do |key, value|
      Material.new key, value
    end
  end

  def self.twin_sword_recipes
    @@twin_sword_recipes ||= self.map_yaml "twin_sword_recipes.yml" do |key, value|
      Recipe.new key
    end
  end
end
