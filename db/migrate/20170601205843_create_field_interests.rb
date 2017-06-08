class CreateFieldInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :field_interests do |t|
      t.string :name
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
