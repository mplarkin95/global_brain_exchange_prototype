class Addpdftostudent < ActiveRecord::Migration[5.0]
  def change
    add_column :student, :pdf, :attachment
  end
end
