require_relative '../test_helper'

class UserDeletesSkillTest < FeatureTest
  def test_user_deletes_skill
    SkillInventory.create({:name => "hello", :status => "world"})
    visit '/skills'
    click_link_or_button("hello")
    assert_equal '/skills/1', current_path
    click_link_or_button("delete")
    assert_equal '/skills', current_path
    refute page.has_content?("hello")
  end
end
