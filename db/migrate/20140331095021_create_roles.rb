class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.string :role_type

      t.timestamps
    end

    ['Admin', 'Sales', 'Noc'].each do |role_name|
      Role.create(:name => role_name, :role_type => 'user')
    end

    ['Sales', 'Billing', 'Rates', 'Noc', 'Legal', 'Account manager'].each do |role_name|
      Role.create(:name => role_name, :role_type => 'account_contact')
    end
  end
end
