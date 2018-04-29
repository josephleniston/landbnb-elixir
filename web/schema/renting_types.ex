defmodule Landbnb.Schema.RentingTypes do
  use Absinthe.Schema.Notation

  alias Landbnb.Resolvers

  @desc "A place available for rent"
  object :rental do
    field :id, :id
    field :rental_type, :string
    field :accommodates, :integer
    field :postal_code, :string
  end


end