class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @installments = installments_by_month
  end

  private

  def installments_by_month
    current_user.wallet.installments.by_month(
      params[:month] || Date.current.month.to_s,
      params[:year]  || Date.current.year.to_s
    )
  end
end