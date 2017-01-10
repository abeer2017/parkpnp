class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :parking_space, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :total_cost
      t.boolean :approve
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
