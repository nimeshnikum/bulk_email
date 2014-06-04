class Role < ActiveRecord::Base
  has_many :users
  
  attr_accessible :description, :name, :role_type

  scope :for_user, where(:role_type => 'user')
  scope :for_account_contact, where(:role_type => 'account_contact')
end
