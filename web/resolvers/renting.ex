defmodule Landbnb.Resolvers.Renting do

  def list_rentals(_parent, _args, _resolution) do
    {:ok, Landbnb.Renting.list_rentals()}
  end

end