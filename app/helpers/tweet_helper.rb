module TweetHelper
  def display_who_to_follow(list)
    markup = ''
    list.each do |flw|
      p flw.username
      markup << "#{render 'a_follow', flw: flw}"
    end
    p markup
    markup.html_safe
  end
end
