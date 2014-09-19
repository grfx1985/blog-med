module PostsHelper
  def is_my_post?(post)
    if current_user && post.user_id == current_user.id
      return true
    else
      return false
    end
  end
end
