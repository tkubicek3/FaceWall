json.array!(@posts_likes) do |posts_like|
  json.extract! posts_like, :id, :post_id, :user_id
  json.url posts_like_url(posts_like, format: :json)
end
