json.extract! contato, :id, :nome, :email, :tipo_id, :obs, :created_at, :updated_at
json.url contato_url(contato, format: :json)
