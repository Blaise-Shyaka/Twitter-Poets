module UserHelper
  def display_followed_by(list)
    markup = ''
    markup = 'No followers yet' if list.empty?
    list.each do |flw|
      markup += render 'follow', flw: flw
    end
    markup.html_safe
  end

  def display_follow_link
    link_to 'Follow', followings_path(following: {follower_id: current_user.id, followed_id: @user.id}), method: :post unless current_user.followeds.include?(@user) || @user == current_user
  end
end