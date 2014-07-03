class Prospect < ActiveRecord::Base
  attr_accessible :company_name, :email1, :email2, :phone, :remarks, :status, :prospect_type

  belongs_to :reference
end
