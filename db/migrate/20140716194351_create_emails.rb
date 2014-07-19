class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :sender_id
      t.integer :email_template_id
      t.string :from
      t.string :target
      t.string :route_type
      t.integer :role_id
      t.text :header
      t.text :body
      t.text :signature
      t.string :subject
      t.datetime :sent_at

      t.timestamps
    end
  end
end
