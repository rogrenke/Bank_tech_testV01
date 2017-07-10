class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
    @userposts = Post.where(user_id: @user.id)
  end


  def user_from_params

    email = user_params.delete(:email)
    password = user_params.delete(:password)
    balance = 0.0

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.balance = balance
    end
  end

end
