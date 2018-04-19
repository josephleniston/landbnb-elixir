defmodule Landbnb.Renting.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_digest, :string
    field :password, :string, virtual: true
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

  def signup(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> generate_password_hash()
  end

  defp generate_password_hash(changeset) do
    password = get_change(changeset, :password)
    hash = Comeonin.Bcrypt.hashpwsalt(password)
    changeset |> put_change(:password_digest, hash)
  end
end
