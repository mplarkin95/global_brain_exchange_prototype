class AddAttachmentPropicToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.attachment :propic
    end
  end

  def self.down
    remove_attachment :students, :propic
  end
end
