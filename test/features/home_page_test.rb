require_relative '../test_helper'

class HomePageTest < FeatureTest
  def test_sees_home_page_title
    visit '/'
    within("#heading") do
      assert page.has_content?("Skill Inventory")
    end
  end

  def test_user_sees_skill_index_link_and_create_new_link
    visit '/'
    within("ul") do
      assert page.find_link("Skill Index")
      assert page.find_link("Create new skill")
    end
  end

  def test_home_page_link_present
    visit '/'
    assert page.has_link?("Home")
  end
end
