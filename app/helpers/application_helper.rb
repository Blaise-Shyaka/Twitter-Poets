# rubocop:disable Layout/LineLength
module ApplicationHelper
  def display_navigation
    return if current_page?(new_user_path) || current_page?(new_session_path) || current_page?(root_path)

    render '/layouts/navigation_bar'
  end

  def display_avi(image_source)
    return image_tag '/assets/person' if image_source.nil?

    image_tag current_user.photo.to_s
  end

  def display_cover_photo(image_source)
    return image_tag '/assets/cover-img' if image_source.nil?

    image_tag current_user.cover_image.to_s
  end

  def display_upvote(tweet)
    upvote = Upvote.where(user_id: current_user.id, tweet_id: tweet.id)
    return 'You upvoted!' if upvote.any?

    link_to 'Upvote', upvotes_path(upvotes: { user_id: current_user.id, tweet_id: tweet.id, page: request.path }), method: :post
  end
end
# rubocop:enable Layout/LineLength
