class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :contact_no, :integer
    add_column :users, :address, :text
    add_column :users, :role, :boolean
  end
end
