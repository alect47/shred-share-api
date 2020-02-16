class Events < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :finish_time
      t.text :details

      t.timestamps
    end
  end
end
