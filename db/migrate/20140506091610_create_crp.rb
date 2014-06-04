class CreateCrp < ActiveRecord::Migration
  def change
    create_table :crp do |t|
      t.integer :country_code
      t.string :country_name
      t.decimal :selling_rate, :precision => 11, :scale => 4
      t.integer :billing_increment
      t.decimal :asr, :precision => 11, :scale => 2
      t.decimal :acd, :precision => 11, :scale => 2
      t.decimal :pdd, :precision => 11, :scale => 2
      t.string :capacity
      t.decimal :buy_lower_range, :precision => 11, :scale => 2
      t.decimal :buy_upper_range, :precision => 11, :scale => 2
      t.decimal :sell_lower_range, :precision => 11, :scale => 2
      t.decimal :sell_upper_range, :precision => 11, :scale => 2
      t.string :vendor1
      t.string :vendor2
      t.string :vendor3
      t.string :vendor4
      t.string :route_type, :limit => 1
      t.string :service_level
      t.string :quality
      t.string :remarks

      t.timestamps
    end
  end
end
