module ApplicationHelper
  def show_language
    [:de, :en].map do |lang|
      if lang == @language
        content_tag(:span, lang.to_s)
      else
        link_to(lang.to_s, switch_language_path(:new_language => lang))
      end
    end.join(' | ').html_safe
  end
end
