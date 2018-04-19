defmodule Landbnb.RentingTest do
  use Landbnb.DataCase

  alias Landbnb.Renting

  describe "rentals" do
    alias Landbnb.Renting.Rental

    @valid_attrs %{accommodates: 42, bathrooms: 42, bedrooms: 42, beds: 42, city: "some city", country: "some country", latitude: "120.5", longitude: "120.5", nightly_cost: "120.5", postal_code: "some postal_code", province: "some province", rental_type: "some rental_type", street1: "some street1", street2: "some street2"}
    @update_attrs %{accommodates: 43, bathrooms: 43, bedrooms: 43, beds: 43, city: "some updated city", country: "some updated country", latitude: "456.7", longitude: "456.7", nightly_cost: "456.7", postal_code: "some updated postal_code", province: "some updated province", rental_type: "some updated rental_type", street1: "some updated street1", street2: "some updated street2"}
    @invalid_attrs %{accommodates: nil, bathrooms: nil, bedrooms: nil, beds: nil, city: nil, country: nil, latitude: nil, longitude: nil, nightly_cost: nil, postal_code: nil, province: nil, rental_type: nil, street1: nil, street2: nil}

    def rental_fixture(attrs \\ %{}) do
      {:ok, rental} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Renting.create_rental()

      rental
    end

    test "list_rentals/0 returns all rentals" do
      rental = rental_fixture()
      assert Renting.list_rentals() == [rental]
    end

    test "get_rental!/1 returns the rental with given id" do
      rental = rental_fixture()
      assert Renting.get_rental!(rental.id) == rental
    end

    test "create_rental/1 with valid data creates a rental" do
      assert {:ok, %Rental{} = rental} = Renting.create_rental(@valid_attrs)
      assert rental.accommodates == 42
      assert rental.bathrooms == 42
      assert rental.bedrooms == 42
      assert rental.beds == 42
      assert rental.city == "some city"
      assert rental.country == "some country"
      assert rental.latitude == Decimal.new("120.5")
      assert rental.longitude == Decimal.new("120.5")
      assert rental.nightly_cost == Decimal.new("120.5")
      assert rental.postal_code == "some postal_code"
      assert rental.province == "some province"
      assert rental.rental_type == "some rental_type"
      assert rental.street1 == "some street1"
      assert rental.street2 == "some street2"
    end

    test "create_rental/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Renting.create_rental(@invalid_attrs)
    end

    test "update_rental/2 with valid data updates the rental" do
      rental = rental_fixture()
      assert {:ok, rental} = Renting.update_rental(rental, @update_attrs)
      assert %Rental{} = rental
      assert rental.accommodates == 43
      assert rental.bathrooms == 43
      assert rental.bedrooms == 43
      assert rental.beds == 43
      assert rental.city == "some updated city"
      assert rental.country == "some updated country"
      assert rental.latitude == Decimal.new("456.7")
      assert rental.longitude == Decimal.new("456.7")
      assert rental.nightly_cost == Decimal.new("456.7")
      assert rental.postal_code == "some updated postal_code"
      assert rental.province == "some updated province"
      assert rental.rental_type == "some updated rental_type"
      assert rental.street1 == "some updated street1"
      assert rental.street2 == "some updated street2"
    end

    test "update_rental/2 with invalid data returns error changeset" do
      rental = rental_fixture()
      assert {:error, %Ecto.Changeset{}} = Renting.update_rental(rental, @invalid_attrs)
      assert rental == Renting.get_rental!(rental.id)
    end

    test "delete_rental/1 deletes the rental" do
      rental = rental_fixture()
      assert {:ok, %Rental{}} = Renting.delete_rental(rental)
      assert_raise Ecto.NoResultsError, fn -> Renting.get_rental!(rental.id) end
    end

    test "change_rental/1 returns a rental changeset" do
      rental = rental_fixture()
      assert %Ecto.Changeset{} = Renting.change_rental(rental)
    end
  end

  describe "users" do
    alias Landbnb.Renting.User

    @valid_attrs %{email: "some email", name: "some name", password_digest: "some password_digest"}
    @update_attrs %{email: "some updated email", name: "some updated name", password_digest: "some updated password_digest"}
    @invalid_attrs %{email: nil, name: nil, password_digest: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Renting.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Renting.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Renting.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Renting.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password_digest == "some password_digest"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Renting.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Renting.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password_digest == "some updated password_digest"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Renting.update_user(user, @invalid_attrs)
      assert user == Renting.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Renting.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Renting.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Renting.change_user(user)
    end
  end

  describe "bookings" do
    alias Landbnb.Renting.Booking

    @valid_attrs %{guests: 42, rental_id: 42, review_comments: "some review_comments", review_score: 42, reviewed_at: "2010-04-17 14:00:00.000000Z", start_date: "2010-04-17 14:00:00.000000Z", stop_date: "2010-04-17 14:00:00.000000Z", user_id: 42}
    @update_attrs %{guests: 43, rental_id: 43, review_comments: "some updated review_comments", review_score: 43, reviewed_at: "2011-05-18 15:01:01.000000Z", start_date: "2011-05-18 15:01:01.000000Z", stop_date: "2011-05-18 15:01:01.000000Z", user_id: 43}
    @invalid_attrs %{guests: nil, rental_id: nil, review_comments: nil, review_score: nil, reviewed_at: nil, start_date: nil, stop_date: nil, user_id: nil}

    def booking_fixture(attrs \\ %{}) do
      {:ok, booking} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Renting.create_booking()

      booking
    end

    test "list_bookings/0 returns all bookings" do
      booking = booking_fixture()
      assert Renting.list_bookings() == [booking]
    end

    test "get_booking!/1 returns the booking with given id" do
      booking = booking_fixture()
      assert Renting.get_booking!(booking.id) == booking
    end

    test "create_booking/1 with valid data creates a booking" do
      assert {:ok, %Booking{} = booking} = Renting.create_booking(@valid_attrs)
      assert booking.guests == 42
      assert booking.rental_id == 42
      assert booking.review_comments == "some review_comments"
      assert booking.review_score == 42
      assert booking.reviewed_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert booking.start_date == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert booking.stop_date == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert booking.user_id == 42
    end

    test "create_booking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Renting.create_booking(@invalid_attrs)
    end

    test "update_booking/2 with valid data updates the booking" do
      booking = booking_fixture()
      assert {:ok, booking} = Renting.update_booking(booking, @update_attrs)
      assert %Booking{} = booking
      assert booking.guests == 43
      assert booking.rental_id == 43
      assert booking.review_comments == "some updated review_comments"
      assert booking.review_score == 43
      assert booking.reviewed_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert booking.start_date == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert booking.stop_date == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert booking.user_id == 43
    end

    test "update_booking/2 with invalid data returns error changeset" do
      booking = booking_fixture()
      assert {:error, %Ecto.Changeset{}} = Renting.update_booking(booking, @invalid_attrs)
      assert booking == Renting.get_booking!(booking.id)
    end

    test "delete_booking/1 deletes the booking" do
      booking = booking_fixture()
      assert {:ok, %Booking{}} = Renting.delete_booking(booking)
      assert_raise Ecto.NoResultsError, fn -> Renting.get_booking!(booking.id) end
    end

    test "change_booking/1 returns a booking changeset" do
      booking = booking_fixture()
      assert %Ecto.Changeset{} = Renting.change_booking(booking)
    end
  end
end
