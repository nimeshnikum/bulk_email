module ProspectsHelper
  def prospect_type_options
    ["C", 'V', 'B', 'F'].collect {|pt| [pt, pt]}
  end

  def status_options
    ["Initial", "In progress"].collect {|s| [s, s]}
  end
end
