require_relative '../test_helper'

class UserEditsSkillTest < FeatureTest
  def test_user_edits_skill
    SkillInventory.create({:name => "minitest", :status => "pro"})
    visit '/skills'
    within("#skill-index") { assert page.has_content?("minitest") }
    click_link_or_button("minitest")
    assert_equal '/skills/1', current_path
    click_link_or_button("edit")
    assert_equal '/skills/1/edit', current_path
    fill_in "skill[name]", with: "bicycling"
    fill_in "skill[status]", with: "mobile"
    click_link_or_button("Submit")
    assert_equal '/skills', current_path
    within("#skill-index") do
      assert page.has_content?("bicycling")
    end
    click_link_or_button("bicycling")
    within("p") { assert page.has_content?("mobile") }
  end
end
