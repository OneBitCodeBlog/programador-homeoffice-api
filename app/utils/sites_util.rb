# frozen_string_literal: true

class SitesUtil
  SITES_CONFIG = YAML.load_file('./config/sites.yml').dig('sites')

  def self.params
    names.map { |name| SITES_CONFIG.dig(name.to_s) }
  end

  def self.names
    SITES_CONFIG.dig('names').split
  end
end
