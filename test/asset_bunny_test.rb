# frozen_string_literal: true

require 'test_helper'

class AssetBunnyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AssetBunny::VERSION
  end
end
