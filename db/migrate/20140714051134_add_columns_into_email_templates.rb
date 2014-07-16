class AddColumnsIntoEmailTemplates < ActiveRecord::Migration
  def up
    add_column :email_templates, :header, :text
    add_column :email_templates, :signature, :text
    add_column :email_templates, :target, :string, :length => 1
    add_column :email_templates, :role_id, :integer
    add_column :email_templates, :template_type, :string
  end

  def down
    remove_column :email_templates, :header
    remove_column :email_templates, :signature
    remove_column :email_templates, :target
    remove_column :email_templates, :role_id
    remove_column :email_templates, :template_type
  end
end
