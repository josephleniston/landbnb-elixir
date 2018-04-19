defmodule Landbnb.Renting.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_digest, :string
    has_many :rentals, Landbnb.Renting.Rental
    has_many :bookings, Landbnb.Renting.Booking
    
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password_digest])
    |> validate_required([:name, :email, :password_digest])
  end
end
