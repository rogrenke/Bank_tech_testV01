class TransactionsController < ApplicationController

  def new
    @transaction = current_user.transactions.build
  end

  def create
    @transaction = current_user.recipes.build(transaction_params)

    if @transaction.save
      redirect_to transaction_path(@transaction), notice: "Transaction Processed!"
    else
      @errors = @transaction.errors.full_messages
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end

end
