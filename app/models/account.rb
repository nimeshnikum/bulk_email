class Account < ActiveRecord::Base
  # attr_accessible :title, :body
#  attr_protected :id, :created_at, :updated_at
  has_many :account_contacts, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :account_reps, dependent: :destroy
  has_many :users, :through => :account_reps
  has_many :email_recipients, :as => :target
  has_many :emails, :through => :email_recipients

  validates :number, presence: true, numericality: {message: "should be in numerical format only"}, length: {is: 5, message: "can be only 5 digits"}
  validates :short_name, presence: true, length: {maximum: 6}
  validates :legal_email, email: true, unless: Proc.new {|a| a.legal_email.blank?}
  validates :dispute_email, email: true, unless: Proc.new {|a| a.dispute_email.blank?}

  def status
    super ? 'Active' : 'Non-active'
  end

  def collect_emails(role_id = nil)
    to = main_contacts
    to += to_contacts(role_id) unless role_id.blank?
    [to.uniq, (cc_contacts - to)]
  end

  def main_contacts
    account_contacts.main.collect(&:email)
  end

  def to_contacts(role_id = nil)
    account_contacts.for_role(4).collect(&:email)
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
