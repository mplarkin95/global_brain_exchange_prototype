class AddAttachmentPropicToRecruiters < ActiveRecord::Migration
  def self.up
    change_table :recruiters do |t|
      t.attachment :propic
    end
  end

  def self.down
    remove_attachment :recruiters, :propic
  end
end
