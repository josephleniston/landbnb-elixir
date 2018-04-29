defmodule Landbnb.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types Landbnb.Schema.AccountTypes
  import_types Landbnb.Schema.RentingTypes

  alias Landbnb.Resolvers

  query do

    @desc "Get all rentals"
    field :rentals, non_null(list_of(non_null(:rental))) do
      resolve &Resolvers.Renting.list_rentals/3
    end
  end
end