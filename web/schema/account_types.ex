defmodule Landbnb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  alias Landbnb.Resolvers

  @desc "A user of Landbnb"
  object :user do
    field :id, :id
    field :email, :string
    field :name, :string

    field :rentals, list_of(:rental) do
      resolve &Resolvers.Accounts.list_users/3
    end
  end

end