module MH4Weapons
  def self.twin_swords
    @@twin_swords ||= YAML.load_file(Rails.root + "lib/yaml/twin_swords.yml").map do |key, value|
      TwinSword.new key, value
    end
  end
end
