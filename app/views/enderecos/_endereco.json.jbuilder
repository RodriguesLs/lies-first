json.extract! endereco, :id, :rua, :cidade, :estado, :contato_id, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
