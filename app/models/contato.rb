class Contato < ActiveRecord::Base
  belongs_to :tipo
  has_one :endereco, dependent: :destroy
  has_many :telefones, dependent: :destroy
  
  accepts_nested_attributes_for :endereco
  accepts_nested_attributes_for :telefones, reject_if: :all_blank, allow_destroy: true
  validates :nome, presence: true, length: {minimum: 3}
  
end