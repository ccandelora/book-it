class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    puts "Now an email can be send to the user(s)"
  end
end
