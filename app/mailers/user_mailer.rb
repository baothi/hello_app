class UserMailer < ApplicationMailer
  before_filter :set_host_from_request, only: [:create]
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  private
    def set_host_from_request
      ActionMailer::Base.default_url_options = { host: request.host_with_port }
    end
end
