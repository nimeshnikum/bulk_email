class Account < ActiveRecord::Base
  # attr_accessible :title, :body
#  attr_protected :id, :created_at, :updated_at
  has_many :account_contacts
  has_many :references
  has_many :account_reps
  has_many :users, :through => :account_reps

  def status
    super ? 'Active' : 'Non-active'
  end

  def main_contacts
    account_contacts.main.collect(&:email)
  end

  def cc_contacts
    account_contacts.cc.collect(&:email)
  end

  def all_emails
    account_contacts.map(&:email)
  end

  def has_contacts?
    !all_emails.blank?
  end

  def title
    number || short_name
  end
end
