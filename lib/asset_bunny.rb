# frozen_string_literal: true

require_relative 'asset_bunny/version'
require_relative 'asset_bunny/configuration'
require_relative 'asset_bunny/client'

module AssetBunny
  module_function

  def configure
    yield(configuration)
  end

  def configuration
    @configuration ||= Configuration.new
  end
end
