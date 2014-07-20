class EmailRecipient < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :email
  belongs_to :target, polymorphic: true
end
