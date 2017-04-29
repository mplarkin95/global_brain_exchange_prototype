class Addpdftostudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :pdf, :attachment
  end
end
