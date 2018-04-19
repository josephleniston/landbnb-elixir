defmodule Landbnb.Renting.Rental do
  use Ecto.Schema
  import Ecto.Changeset


  schema "rentals" do
    field :accommodates, :integer
    field :bathrooms, :integer
    field :bedrooms, :integer
    field :beds, :integer
    field :city, :string
    field :country, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :nightly_cost, :decimal
    field :description, :string
    field :postal_code, :string
    field :province, :string
    field :rental_type, :string
    field :street1, :string
    field :street2, :string
    belongs_to :user, Landbnb.Renting.User

    timestamps()
  end

  @doc false
  def changeset(rental, attrs) do
    rental
    |> cast(attrs, [:user_id, :rental_type, :accommodates, :bathrooms, :bedrooms, :beds, :nightly_cost, :description, :latitude, :longitude, :street1, :street2, :city, :province, :country, :postal_code])
    |> validate_required([:user_id, :rental_type, :accommodates, :bathrooms, :bedrooms, :beds, :nightly_cost, :description, :latitude, :longitude, :street1, :street2, :city, :province, :country, :postal_code])
  end
end
