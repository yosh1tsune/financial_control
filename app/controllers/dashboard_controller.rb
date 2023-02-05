class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @installments = filter
  end

  private

  def filter
    return installments.joins(debt: :credit_card).where(filter_params) if filter_params.to_h.any?

    installments
  end

  def installments
    if params[:installments].present?
      Installment.where(id: params[:installments])
    else
      installments_by_month
    end
  end

  def installments_by_month
    current_user.wallet.installments.by_month(
      params[:month] || Date.current.month.to_s,
      params[:year]  || Date.current.year.to_s
    ).where(filter_params)
  end

  def filter_params
    params.permit(credit_card: :id)
  end
end