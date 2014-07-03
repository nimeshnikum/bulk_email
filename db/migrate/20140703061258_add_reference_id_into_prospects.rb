class AddReferenceIdIntoProspects < ActiveRecord::Migration
  def up
    add_column :prospects, :reference_id, :integer
  end

  def down
    remove_column :prospects, :reference_id
  end
end
