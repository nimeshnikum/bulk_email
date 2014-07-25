class Prospect < ActiveRecord::Base
  attr_accessible :company_name, :email1, :email2, :phone, :remarks, :status, :prospect_type

  belongs_to :reference
  has_many :email_recipients, :as => :target
  has_many :emails, :through => :email_recipients

  validates :email1, presence: true
  validates :email1, email: true, unless: Proc.new {|a| a.email1.blank?}
  validates :email2, email: true, unless: Proc.new {|a| a.email2.blank?}

  def collect_emails
    [email1.to_s, email2.to_s]
  end
end
