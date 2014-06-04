class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :account_id
      t.string :company
      t.string :email
      t.string :contact
      t.string :phone

      t.timestamps
    end
  end
end
