class PrincipalController < ApplicationController
before_action :authenticate_user!
  def inicio
  end
end
