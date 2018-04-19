defmodule Landbnb.Repo.Migrations.CreateRentals do
  use Ecto.Migration

  def change do
    create table(:rentals) do
      add :rental_type, :string
      add :accommodates, :integer
      add :bathrooms, :integer
      add :bedrooms, :integer
      add :beds, :integer
      add :nightly_cost, :decimal
      add :latitude, :decimal
      add :longitude, :decimal
      add :street1, :string
      add :street2, :string
      add :city, :string
      add :province, :string
      add :country, :string
      add :postal_code, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:rentals, [:user_id])
  end
end
