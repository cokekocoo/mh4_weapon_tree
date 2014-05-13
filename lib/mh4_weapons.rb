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
end
