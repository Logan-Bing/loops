class CreateFidelityPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :fidelity_programs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :points_per_euro
      t.boolean :active
      t.datetime :created
      t.datetime :updated

      t.timestamps
    end
  end
end
