module MH4Weapons
  def self.yaml_basepath
    Rails.root + "lib/yaml/"
  end

  def self.twin_swords
    @@twin_swords ||= YAML.load_file("#{self.yaml_basepath}twin_swords.yml").map do |key, value|
      TwinSword.new key, value
    end
  end
end
