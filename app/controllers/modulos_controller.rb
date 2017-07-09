class ModulosController < ApplicationController
	respond_to :json

	  def modulos
        render json: Modulo.all.to_json(include: :screens)
    end

end
