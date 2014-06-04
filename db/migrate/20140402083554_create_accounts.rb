class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number, :limit => 5
      t.string :short_name, :limit => 50
      t.string :official_name
      t.text :address
      t.string :legal_email
      t.string :dispute_email
      t.integer :credit_limit
      t.text :credit_limit_history
      t.integer :max_block_limit
      t.string :payment_term, :limit => 15
      t.integer :payment_cycle
      t.string :customer_type, :limit => 1
      t.decimal :last_invoice_amount, :precision => 11, :scale => 2
      t.datetime :last_invoice_date
      t.decimal :current_balance, :precision => 11, :scale => 2
      t.datetime :current_balance_date
      t.string :grade, :limit => 15
      t.boolean :status, :default => true
      t.string :status_history
      t.boolean :opt_in

      t.timestamps
    end
  end
end
