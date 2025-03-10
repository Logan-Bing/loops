class CreateParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :participations do |t|
      t.integer :points
      t.references :inscription, null: false, foreign_key: true
      t.datetime :created

      t.timestamps
    end
  end
end
