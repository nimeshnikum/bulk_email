class Prospect < ActiveRecord::Base
  attr_accessible :company_name, :email1, :email2, :phone, :remarks, :status, :prospect_type

  belongs_to :reference

  validates :email1, email: true, unless: Proc.new {|a| a.email1.blank?}
  validates :email2, email: true, unless: Proc.new {|a| a.email2.blank?}
end
