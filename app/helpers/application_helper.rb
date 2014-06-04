module ApplicationHelper
  def service_level_options
    ["Platinum", "Gold", "Silver"].collect {|sl| [sl, sl]}
  end

  def quality_options
    ["Blank", "Direct", "FAS Free", "TDM", "CLI"].collect {|q| [q, q]}
  end

  def account_options(accounts = Account.all)
    accounts.collect {|acc| [acc.number, acc.id]}
  end
end
