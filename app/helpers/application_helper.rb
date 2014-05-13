module ApplicationHelper
  def link_to_twin_sword twin_sword, options = {}
    link_to twin_sword.name, twin_sword_path(twin_sword.name) + "#current", options
  end
end
