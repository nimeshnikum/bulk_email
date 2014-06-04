class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :number, :limit => 4
      t.string :first_name
      t.string :last_name
      t.integer :role_id
      t.string :signature
      t.string :msn
      t.string :phone
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
