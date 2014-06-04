class CreateTopRoutes < ActiveRecord::Migration
  def change
    create_table :top_routes do |t|
      t.integer :country_code
      t.string :country_name
      t.decimal :selling_rate, :precision => 11, :scale => 4
      t.decimal :asr, :precision => 11, :scale => 2
      t.decimal :acd, :precision => 11, :scale => 2
      t.string :capacity
      t.string :service_level
      t.string :quality
      t.string :remarks
      t.boolean :select_for_promotion

      t.timestamps
    end
  end
end
