class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.references :fidelity_program, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :points_required

      t.timestamps
    end
  end
end
