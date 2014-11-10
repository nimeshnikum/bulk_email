module ApplicationHelper
  def service_level_options
    ["Platinum", "Gold", "Silver"].collect {|sl| [sl, sl]}
  end

  def quality_options
    ["Blank", "Direct", "FAS Free", "TDM", "CLI"].collect {|q| [q, q]}
  end

  def account_options(accounts = Account.all)
    accounts.collect {|acc| [account_title(acc), acc.id]}
  end

  def custom_error_messages_for(object)
    return unless object.respond_to?(:errors) && object.errors.any?

    errors_list = ""
    errors_list << object.errors.full_messages.map { |message| content_tag(:li, message) }.join("\n")

    
    content_tag(:div, :id => "error_explanation") do
      content_tag(:h2, "#{pluralize(object.errors.count, "error")} prohibited this post from being saved!") +
      content_tag(:ul, errors_list.html_safe)
    end
  end

  def account_title(account, len = 40)
    account.number + " - " + truncate(account.short_name, length: len)
  end
end
