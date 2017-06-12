class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.string :party_name
      t.references :election, foreign_key: true

      t.timestamps
    end
  end
end
