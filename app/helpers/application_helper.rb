module ApplicationHelper
  def display_navigation
    render '/layouts/navigation_bar' unless current_page?(new_user_path) || current_page?(new_session_path) || current_page?(root_path)
  end

  def display_avi(image_source)
    return image_tag '/assets/person' if image_source.nil?
    image_tag "#{current_user.photo}"
  end

  def display_cover_photo(image_source)
    return image_tag '/assets/cover-img' if image_source.nil?
    image_tag "#{current_user.cover_image}"
  end

  def display_upvote(tweet)
    upvote = Upvote.where(user_id: current_user.id, tweet_id: tweet.id)
    if upvote.any?
      return 'You upvoted!'
    end
    link_to 'Upvote', upvotes_path(upvotes: {user_id: current_user.id, tweet_id: tweet.id, page: request.path}), method: :post
  end
end
