module CrpsHelper
  def route_type_options
    ["D", "W"].collect {|rt| [rt, rt]}
  end
end
