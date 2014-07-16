class EmailTemplate < ActiveRecord::Base
  attr_accessible :body, :from, :name, :subject, :is_default, :target, :role_id, :template_type, :header, :signature

  belongs_to :role

  scope :default, where(:is_default => true)
  scope :non_default, where(:is_default => false)

  validates :from, email: true, unless: Proc.new {|a| a.from.blank?}
    
  def target_text
    target.eql?('C') ? 'Customers' : 'Prospects' unless target.blank?
  end

  def customer_role
    target.eql?('C') ? role.try(:name) : 'NONE'
  end

  def template_type_text
    case template_type
    when 'top_routes'
      'Top Routes'
    when 'crp'
      'CRP'
    else
      'NONE'
    end
  end
end
