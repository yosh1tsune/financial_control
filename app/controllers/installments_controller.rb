class InstallmentsController < ApplicationController
  def update
    @installment = Installment.find params[:id]

    respond_to do |format|
      if @installment.update(installments_params)
        flash.now[:notice] = 'User was successfully updated.'
        format.html { redirect_back(fallback_location: root_path) }
        format.json { respond_with_bip(@installment) }
      else
        flash.now[:alert] = @installment.errors.full_messages
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@installment) }
      end
    end
  end

  def installments_params
    params.require(:installment).permit(:value)
  end
end
