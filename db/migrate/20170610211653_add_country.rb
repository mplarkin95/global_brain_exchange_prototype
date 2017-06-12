class AddCountry < ActiveRecord::Migration[5.0]
  def change
  	add_column :recruiters, :country, :string
  	add_column :students, :country, :string
  end
end
