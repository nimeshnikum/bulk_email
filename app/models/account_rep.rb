class AccountRep < ActiveRecord::Base
  attr_accessible :account_id, :rep_level, :user_id

  belongs_to :account
  belongs_to :user
end
