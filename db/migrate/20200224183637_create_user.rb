class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :google_token
      t.string :google_refresh_token
      t.string :picture
      t.boolean :verified, default: false
      t.datetime :google_oauth_expires_at

      t.timestamps
    end
  end
end
