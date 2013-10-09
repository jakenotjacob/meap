module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      #Define a named block of content "title"
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
    end
  end
end
