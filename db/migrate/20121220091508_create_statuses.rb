class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :user, null: false
      t.string :message, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end

    add_foreign_key :statuses, :users

    add_index :statuses, :user_id, :unique => true
  end
end
