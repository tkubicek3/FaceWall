# PostsHelper
module PostsHelper
  def info_text(post)
    return '' unless post.gallery_image

    gallery = post.gallery_image.gallery
    return 'Post new photo' unless gallery

    user_of_gallery = gallery.user
    return 'Comment photo' if user_of_gallery.id == post.user_id

    "Comment photo of #{link_to user_of_gallery.full_name, user_path(user_of_gallery.id), class: 'link-def-b'}".html_safe
  end
end
