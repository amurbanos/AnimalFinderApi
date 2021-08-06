class ApplicationController < ActionController::API

  # retorna usuario nao encontrado
  def not_found
    render json: { error: 'not_found' }
  end

  # valida JWT quando solicitado
  # cria atributo @current_user que ficara disponivel em todos os controllers herdados
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

end
