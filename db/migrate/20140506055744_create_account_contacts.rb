class CreateAccountContacts < ActiveRecord::Migration
  def change
    create_table :account_contacts do |t|
      t.integer :account_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :skype
      t.string :msn
      t.string :icq
      t.integer :role_id
      t.boolean :main_contact

      t.timestamps
    end
  end
end
