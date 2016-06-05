class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.string :type
      t.string :event
      t.datetime :timestamp

      t.timestamps null: false
    end
  end
end
