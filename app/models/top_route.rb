require 'roo'

class TopRoute < ActiveRecord::Base
  attr_accessible :acd, :asr, :capacity, :country_code, :country_name, :quality, :remarks, :select_for_promotion, :selling_rate, :service_level

  validates :country_name, presence: true

  def self.import(file, full_upload = false)
    # In case of full upload, first delete all existing records
    if full_upload
      self.destroy_all
    end

    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      record = find_by_country_name(row["country_name"]) || new
      record.attributes = row.to_hash.slice(*accessible_attributes)
      record.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end


end
