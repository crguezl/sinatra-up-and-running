module ApplicationHelper
  def title(value = nil)
    @title = "Controller Demo"
    @title += " #{value}" if value
  end
end
