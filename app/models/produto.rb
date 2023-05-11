class Produto < ApplicationRecord

    has_one_attached :imagem

    attribute :marca, :string


end
