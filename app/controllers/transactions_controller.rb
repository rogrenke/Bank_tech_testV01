class TransactionsController < ApplicationController

  def new
    @transaction = current_user.transactions.build
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.update(balance_after_transaction: current_user.balance)

    if @transaction.save
      redirect_to transaction_path(@transaction), notice: "Transaction Processed!"
    else
      @errors = @transaction.errors.full_messages
      render :new
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end

end
