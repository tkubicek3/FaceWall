json.array!(@gallery_images) do |gallery_image|
  json.extract! gallery_image, :id, :gallery_id, :description
  json.url gallery_image_url(gallery_image, format: :json)
end
