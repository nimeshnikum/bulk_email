module EmailsHelper
  def email_template_options
    EmailTemplate.all.collect {|et| [et.name, et.id]}
  end
end
