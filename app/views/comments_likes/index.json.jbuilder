json.array!(@comments_likes) do |comments_like|
  json.extract! comments_like, :id, :comment_id, :user_id
  json.url comments_like_url(comments_like, format: :json)
end
