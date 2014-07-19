class CreateEmailRoutes < ActiveRecord::Migration
  def change
    create_table :email_routes do |t|
      t.integer :email_id
      t.integer :route_id
      t.string :route_type

      t.timestamps
    end
  end
end
