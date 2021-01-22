module UserHelper
  def display_followed_by(list)
    markup = ''
    markup = 'No followers yet' if list.empty?
    list.each do |flw|
      markup += render 'follow', flw: flw
    end
    markup.html_safe
  end
end