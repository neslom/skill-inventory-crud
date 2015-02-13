class SkillInventory
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_dev.sqlite3")
    end
  end

  def self.dataset
    database[:skills]
  end

  def self.create(skill)
    skillset = { :name => skill[:name], :status => skill[:status] }
    dataset.insert(skillset)
  end

  def self.all
    raw_skills.map {|data| Skill.new(data)}
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.update(id, skill)
    dataset.where(:id => id).update(:name => skill[:name], :status => skill[:status])
  end

  def self.delete(id)
    dataset.where(:id => id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.raw_skill(id)
    dataset.first(:id => id)
  end

  def self.raw_skills
    dataset.to_a
  end

  private_class_method :raw_skills, :raw_skill
end
