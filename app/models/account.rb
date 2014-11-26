class Account < ActiveRecord::Base
  attr_accessible :number, :short_name, :official_name, :address, :legal_email, :dispute_email, :credit_limit, :credit_limit_history, :max_block_limit, :payment_term,
    :payment_cycle, :customer_type, :last_invoice_amount, :last_invoice_date, :current_balance, :current_balance_date, :grade, :status, :status_history, :opt_in
  
#  attr_protected :id, :created_at, :updated_at
  has_many :account_contacts, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :account_reps, dependent: :destroy
  has_many :users, :through => :account_reps
  has_many :email_recipients, :as => :target
  has_many :emails, :through => :email_recipients

  validates :number, presence: true, numericality: {message: "should be in numerical format only"}, length: {is: 5, message: "can be only 5 digits"}
  validates :short_name, presence: true, length: {maximum: 6}
  validates :legal_email, email: true, unless: Proc.new {|a| a.legal_email.blank?}
  validates :dispute_email, email: true, unless: Proc.new {|a| a.dispute_email.blank?}

  def status
    super ? 'Active' : 'Non-active'
  end

  def collect_emails(role_id = nil)
    to = main_contacts
    to += to_contacts(role_id) unless role_id.blank?
    [to.uniq, (cc_contacts - to)]
  end

  def main_contacts
    account_contacts.main.collect(&:email)
  end

  def to_contacts(role_id = nil)
    account_contacts.for_role(4).collect(&:email)
  end

  def cc_contacts
    account_contacts.cc.collect(&:email)
  end

  def all_emails
    account_contacts.map(&:email)
  end

  def has_contacts?
    !all_emails.blank?
  end

  def title
    number || short_name
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
#      raise row["number"].inspect
#      raise find_by_number(row["number"].to_i).inspect
      record = find_by_number(row["number"].to_i) || new
#      raise accessible_attributes.inspect
      record.attributes = row.to_hash.slice(*accessible_attributes)
#      raise record.inspect
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
