class CreateAccountReps < ActiveRecord::Migration
  def change
    create_table :account_reps do |t|
      t.integer :user_id
      t.integer :account_id
      t.integer :rep_level, :limit => 1

      t.timestamps
    end
  end
end
