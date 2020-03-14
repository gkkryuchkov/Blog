json.extract! notification, :id, :text, :article_id, :comment_id, :seen, :created_at, :updated_at
json.url notification_url(notification, format: :json)
