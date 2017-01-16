class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: 'Куплен счастливый билет')
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: 'OH NOOOOOOOOOO отмена билета')
  end
end
