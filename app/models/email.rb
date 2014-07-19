class Email < ActiveRecord::Base
  attr_accessor :account_ids, :top_route_ids, :crp_ids

  attr_accessible :account_ids, :top_route_ids, :crp_ids, :from, :subject, :header, :body, :signature

  belongs_to :email_template
  belongs_to :sender, :class_name => 'User'

  validates :email_template_id, :target, presence: true
  validates :from, email: true, unless: Proc.new {|a| a.from.blank?}, on: :update

  after_create :copy_from_template

  def initiate_from_template(email_template)
    self.target = email_template.target
    self.role_id = email_template.role_id
    self.route_type = email_template.template_type
  end

  def copy_from_template
    self.from = email_template.from
    self.header = email_template.header
    self.body = email_template.body
    self.signature = email_template.signature
    self.subject = email_template.subject
    self.save!
  end

  def target_is_customer?
    target == 'C'
  end
end
