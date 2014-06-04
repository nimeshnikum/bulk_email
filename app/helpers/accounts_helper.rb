module AccountsHelper
  def payment_term_options
    ['Pre', 'Post', 'Vertecto', 'Zero Credit', 'Other'].collect do |pt|
      [pt, pt.downcase.delete(' ')]
    end
  end

  def payment_cycle_options
    i = 0
    ["7/3", "7/5", "7/7", "15/3", "15/7", "15/15"].collect do |pc|
      i += 1
      [pc, i]
    end
  end

  def customer_type_options
    ['C', 'V', 'B', 'F'].collect {|ct| [ct, ct]}
  end

  def grade_options
    ['Fraud', 'Good', 'Risky'].collect {|g| [g, g]}
  end

  def date_format(date)
    date.try(:strftime, "%Y-%m-%d")
  end
end
