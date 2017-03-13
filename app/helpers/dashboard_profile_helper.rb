module DashboardProfileHelper
  def active_nav(path)
    'active' if current_page?(path)
  end
end
