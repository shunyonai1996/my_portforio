module ApplicationHelper
  def full_title(page_title = '')
    base_title = "だいJobそ？"
    page_title.empty? ? base_title : page_title + "|" + base_title
  end
end