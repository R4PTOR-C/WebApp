class Produto < ApplicationRecord

    has_one_attached :imagem

    attribute :marca, :string

    attribute :content, :text

    def formatted_conteudo_caixa
        ActionController::Base.helpers.simple_format(content.to_s)
    end
end
