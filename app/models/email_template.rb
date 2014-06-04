class EmailTemplate < ActiveRecord::Base
  attr_accessible :body, :from, :name, :subject, :is_default

  scope :default, where(:is_default => true)
  scope :non_default, where(:is_default => false)
end
