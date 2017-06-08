class Add < ActiveRecord::Migration[5.0]
  def change
  	add_column :recruiters, :school, :string
  end
end
