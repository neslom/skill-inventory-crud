ENV['TASK_MANAGER_ENV'] ||= 'test'

require 'bundler'
Bundler.require

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'capybara'

class ModelTest < Minitest::Test
  def teardown
    SkillInventory.delete_all
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    SkillInventory.delete_all
  end
end
