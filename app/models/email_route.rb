class EmailRoute < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :email
  belongs_to :route, polymorphic: true
end
