class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.integer :category_id
      t.time :meet_time
      t.integer :proposer_id
      t.string :visual
      t.integer :duration
      t.string :cost_level

      t.timestamps

    end
  end
end
