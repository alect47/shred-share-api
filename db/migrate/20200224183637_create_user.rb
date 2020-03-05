class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :pass
      t.string :name
      t.string :username
      t.string :phone_number

      t.timestamps
    end
  end
end
