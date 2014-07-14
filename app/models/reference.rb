class Reference < ActiveRecord::Base
  attr_accessible :account_id, :company, :contact, :email, :phone

  belongs_to :account
  has_one :prospect

  validates :email, email: true, unless: Proc.new {|a| a.email.blank?}

  def generate_prospect
    return false if prospect.present?

    prospect = build_prospect
    prospect.company_name = company
    prospect.email1       = email
    prospect.phone        = phone
    prospect.status       = "Initial"
    prospect.save!
  end
end
