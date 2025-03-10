class CreateInscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :inscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fidelity_program, null: false, foreign_key: true
      t.datetime :created

      t.timestamps
    end
  end
end
