class Email1
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :from, :to, :subject, :body, :account_ids, :email_template_id, :top_route_ids

  validates :subject, :body, :email_template_id, :presence => true
  validate :check_account_ids

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def check_account_ids
    if account_ids.blank?
      errors.add(:account_ids, "At least one customer should be selected")
    end
  end
end