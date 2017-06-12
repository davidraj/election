class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :electoral_id
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :pincode

      t.timestamps
    end
  end
end
