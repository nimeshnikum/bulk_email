class Crp < ActiveRecord::Base
  self.pluralize_table_names = false
#  set_table_name 'crp'
  attr_accessible :acd, :asr, :billing_increment, :buy_lower_range, :buy_upper_range, :capacity, :country_code, :country_name, :pdd, :quality, :remarks, :route_type, :sell_lower_range, :sell_upper_range, :selling_rate, :service_level, :vendor1, :vendor2, :vendor3, :vendor4
end
