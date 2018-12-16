defmodule TicketLockerApp.Repo do
  use Ecto.Repo,
    otp_app: :ticket_locker_app,
    adapter: Ecto.Adapters.MySQL
end
