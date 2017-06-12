class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :election, foreign_key: true
      t.references :candidate, foreign_key: true
      t.integer :vote_count

      t.timestamps
    end
    
    add_index :votes, :vote_count
    add_index :votes, [:election_id, :candidate_id]
  end
end
