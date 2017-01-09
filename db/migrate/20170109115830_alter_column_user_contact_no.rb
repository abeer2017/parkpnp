class AlterColumnUserContactNo < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.change :contact_no, :string
    end
  end
  def self.down
    change_table :users do |t|
      t.change :contact_no, :integer
    end
  end
end
