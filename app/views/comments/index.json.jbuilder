json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :user_id, :gallery_image_id, :post_id
  json.url comment_url(comment, format: :json)
end
