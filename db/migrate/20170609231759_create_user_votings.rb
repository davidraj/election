class CreateUserVotings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_votings do |t|
      t.references :election, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :voting_count, default: 0

      t.timestamps
    end
    add_index :user_votings, [:election_id,:user_id]
  end
end
