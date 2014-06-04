class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :company_name
      t.string :email1
      t.string :email2
      t.string :phone
      t.string :prospect_type, :limit => 1
      t.string :status
      t.text :remarks

      t.timestamps
    end
  end
end
