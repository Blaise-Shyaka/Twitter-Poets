# rubocop:disable Style/RedundantInterpolation
module TweetHelper
  def display_who_to_follow(list)
    markup = ''
    list.each do |flw|
      markup << "#{render 'a_follow', flw: flw}"
    end

    markup.html_safe
  end
end
# rubocop:enable Style/RedundantInterpolation
