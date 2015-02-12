require_relative '../test_helper'

class SkillInventoryTest < ModelTest
  def create_skill
    SkillInventory.create({:name => "testee name", :status => "testee status"})
  end

  def test_can_create_a_skill
    SkillInventory.create({:name => "testee name", :status => "testee status"})
    skill = SkillInventory.all.first
    assert_equal "testee name", skill.name
    assert_equal "testee status", skill.status
  end

  def test_returns_all_skill_instances
    5.times { create_skill }
    skills = SkillInventory.all
    assert_equal 5, skills.count
    assert_equal 1, skills.first.id
    assert_equal 4, skills[-2].id
  end

  def test_can_find_skill_by_id
    create_skill
    SkillInventory.create({:name => "physicz", :status => "newt status"})
    found_skill = SkillInventory.find(2)
    assert_equal "physicz", found_skill.name
    assert_equal "newt status", found_skill.status
  end

  def test_can_updated_a_skill
    2.times { create_skill }
    SkillInventory.update(2, {:name => "say hi", :status => "hello"})
    assert_equal "say hi", SkillInventory.all.last.name
  end

  def test_it_can_delete_a_skill
    2.times { create_skill }
    assert_equal 2, SkillInventory.all.count
    SkillInventory.delete(2)
    assert_equal 1, SkillInventory.all.count
  end

  def test_delete_all
    2.times { create_skill }
    assert_equal 2, SkillInventory.all.count
    SkillInventory.delete_all
    assert_equal 0, SkillInventory.all.count
  end
end
