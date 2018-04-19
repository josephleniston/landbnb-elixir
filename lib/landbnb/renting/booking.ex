defmodule Landbnb.Renting.Booking do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bookings" do
    field :guests, :integer
    field :review_comments, :string
    field :review_score, :integer
    field :reviewed_at, :utc_datetime
    field :start_date, :utc_datetime
    field :stop_date, :utc_datetime
    belongs_to :user, Landbnb.Renting.User
    belongs_to :rental, Landbnb.Renting.Rental

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:user_id, :rental_id, :start_date, :stop_date, :guests, :review_score, :review_comments, :reviewed_at])
    |> validate_required([:user_id, :rental_id, :start_date, :stop_date, :guests, :review_score, :review_comments, :reviewed_at])
  end
end
