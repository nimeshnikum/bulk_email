module ReferencesHelper
  def prospect_status(reference)
    if reference.prospect.present?
      ("Yes " + link_to('(Go to Prospect)', prospect_path(reference.prospect))).html_safe
    else
      "No"
    end
  end
end
