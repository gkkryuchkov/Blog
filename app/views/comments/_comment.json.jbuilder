json.extract! comment, :id, :rating, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
