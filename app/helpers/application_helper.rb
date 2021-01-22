module ApplicationHelper
  def display_navigation
    render '/layouts/navigation_bar' unless current_page?(new_user_path) || current_page?(new_session_path) || current_page?(root_path)
  end
end
