class CreateIncriptionRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :incription_rewards do |t|
      t.references :inscription, null: false, foreign_key: true
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
