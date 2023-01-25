class InstallmentsController < ApplicationController
  def update
    @installment = Installment.find params[:id]

    respond_to do |format|
      if @installment.update(installments_params)
        format.html { redirect_to(@installment, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@installment) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@installment) }
      end
    end
  end

  def installments_params
    params.require(:installment).permit(:value)
  end
end
