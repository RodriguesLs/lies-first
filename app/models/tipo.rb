class Tipo < ActiveRecord::Base
    has_many :contatos, dependent: :destroy
end
