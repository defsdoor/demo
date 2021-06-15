module ApplicationHelper

  def style_attribute( styles )
    return "" unless styles
    "style=\"#{ styles }\"".html_safe
  end
end
