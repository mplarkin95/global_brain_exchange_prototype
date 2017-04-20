class CreateRecruiters < ActiveRecord::Migration[5.0]
  def change
    create_table :recruiters do |t|
      t.string :name
      t.text :search_preferences
      t.text :bio

      t.timestamps
    end
  end
end
