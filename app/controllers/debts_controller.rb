class DebtsController < ApplicationController
  before_action :authenticate_user!

  def new
    @debt = current_user.wallet.debts.new
  end

  def create
    @debt = current_user.wallet.debts.new(debt_params)

    if @debt.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Débito adicionado com sucesso' }
        format.turbo_stream { redirect_to root_path, notice: 'Débito adicionado com sucesso' }
      end
    else
      flash.now[:alert] = 'Erro'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def debt_params
    params.require(:debt).permit(:value, :date)
  end
end