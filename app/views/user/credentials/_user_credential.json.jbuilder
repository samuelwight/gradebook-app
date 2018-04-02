json.extract! user_credential, :id, :username, :password, :user_id, :created_at, :updated_at
json.url user_credential_url(user_credential, format: :json)
