class CreateElections < ActiveRecord::Migration[5.0]
  def change
    create_table :elections do |t|
      t.string :title
      t.text :description
      t.integer :max_votes_per_user

      t.timestamps
    end
  end
end
