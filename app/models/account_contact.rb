class AccountContact < ActiveRecord::Base
  attr_accessible :account_id, :customer_type, :email, :icq, :main_contact, :msn, :name, :phone, :role_id, :skype

  belongs_to :account
  belongs_to :role

  scope :main, where(:main_contact => true)
  scope :cc, where(:main_contact => false)
  scope :for_role, lambda {|role_id| where(:role_id => role_id)}

  validates :email, email: true, unless: Proc.new {|a| a.email.blank?}
end
