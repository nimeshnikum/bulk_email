module LogsHelper

  def customers_with_name(accounts)
    accounts.collect do |account|
      account.number.to_s + " (#{account.official_name.to_s})"
    end.join(", ")
  end
end
