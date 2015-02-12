require_relative '../test_helper'

class UserCreatesSkillTest < FeatureTest
  def test_user_creates_new_skill
    visit '/'
    click_link_or_button("Create new skill")
    assert_equal '/skills/new', current_path
    fill_in "skill[name]", with: "Rspecing"
    fill_in "skill[status]", with: "workin on it"
    click_link_or_button("Add Skill")
    assert_equal '/skills', current_path
    within("#skill-index") do
      assert page.has_content?("Rspecing")
    end
    click_link_or_button("Rspecing")
    assert_equal '/skills/1', current_path
    assert page.has_content?("workin on it")
  end
end
