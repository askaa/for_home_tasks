class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer  "user_id"
      t.integer  "petition_id"
      t.timestamps null: false
    end
    add_index :votes, [:petition_id, :created_at]
    add_index :votes, [:user_id, :created_at]
  end
end
