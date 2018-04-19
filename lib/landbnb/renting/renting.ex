defmodule Landbnb.Renting do
  @moduledoc """
  The Renting context.
  """

  import Ecto.Query, warn: false
  alias Landbnb.Repo

  alias Landbnb.Renting.Rental

  @doc """
  Returns the list of rentals.

  ## Examples

      iex> list_rentals()
      [%Rental{}, ...]

  """
  def list_rentals do
    Repo.all(Rental)
  end

  @doc """
  Gets a single rental.

  Raises `Ecto.NoResultsError` if the Rental does not exist.

  ## Examples

      iex> get_rental!(123)
      %Rental{}

      iex> get_rental!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rental!(id), do: Repo.get!(Rental, id)

  @doc """
  Creates a rental.

  ## Examples

      iex> create_rental(%{field: value})
      {:ok, %Rental{}}

      iex> create_rental(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rental(attrs \\ %{}) do
    %Rental{}
    |> Rental.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rental.

  ## Examples

      iex> update_rental(rental, %{field: new_value})
      {:ok, %Rental{}}

      iex> update_rental(rental, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rental(%Rental{} = rental, attrs) do
    rental
    |> Rental.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rental.

  ## Examples

      iex> delete_rental(rental)
      {:ok, %Rental{}}

      iex> delete_rental(rental)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rental(%Rental{} = rental) do
    Repo.delete(rental)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rental changes.

  ## Examples

      iex> change_rental(rental)
      %Ecto.Changeset{source: %Rental{}}

  """
  def change_rental(%Rental{} = rental) do
    Rental.changeset(rental, %{})
  end

  alias Landbnb.Renting.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Landbnb.Renting.Booking

  @doc """
  Returns the list of bookings.

  ## Examples

      iex> list_bookings()
      [%Booking{}, ...]

  """
  def list_bookings do
    Repo.all(Booking)
  end

  @doc """
  Gets a single booking.

  Raises `Ecto.NoResultsError` if the Booking does not exist.

  ## Examples

      iex> get_booking!(123)
      %Booking{}

      iex> get_booking!(456)
      ** (Ecto.NoResultsError)

  """
  def get_booking!(id), do: Repo.get!(Booking, id)

  @doc """
  Creates a booking.

  ## Examples

      iex> create_booking(%{field: value})
      {:ok, %Booking{}}

      iex> create_booking(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_booking(attrs \\ %{}) do
    %Booking{}
    |> Booking.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a booking.

  ## Examples

      iex> update_booking(booking, %{field: new_value})
      {:ok, %Booking{}}

      iex> update_booking(booking, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_booking(%Booking{} = booking, attrs) do
    booking
    |> Booking.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Booking.

  ## Examples

      iex> delete_booking(booking)
      {:ok, %Booking{}}

      iex> delete_booking(booking)
      {:error, %Ecto.Changeset{}}

  """
  def delete_booking(%Booking{} = booking) do
    Repo.delete(booking)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking booking changes.

  ## Examples

      iex> change_booking(booking)
      %Ecto.Changeset{source: %Booking{}}

  """
  def change_booking(%Booking{} = booking) do
    Booking.changeset(booking, %{})
  end
end
