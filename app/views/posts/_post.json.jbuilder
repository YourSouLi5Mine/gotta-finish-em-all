json.extract! post, :id, :created_at, :updated_at, :content
json.url post_url(post, format: :json)
