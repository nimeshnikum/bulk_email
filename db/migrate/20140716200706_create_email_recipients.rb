class CreateEmailRecipients < ActiveRecord::Migration
  def change
    create_table :email_recipients do |t|
      t.integer :target_id
      t.string :target_type
      t.string :to
      t.text :cc
      t.datetime :sent_at

      t.timestamps
    end
  end
end
