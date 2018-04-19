defmodule Landbnb.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :start_date, :utc_datetime
      add :stop_date, :utc_datetime
      add :guests, :integer
      add :review_score, :integer
      add :review_comments, :text
      add :reviewed_at, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)
      add :rental_id, references(:rentals, on_delete: :nothing)

      timestamps()
    end

    create index(:bookings, [:user_id])
    create index(:bookings, [:rental_id])
  end
end
