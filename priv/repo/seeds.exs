# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Landbnb.Repo.insert!(%Landbnb.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias Landbnb.Renting.Booking
alias Landbnb.Renting.Rental
alias Landbnb.Renting.User
alias Landbnb.Repo

Repo.delete_all(Booking)
Repo.delete_all(Rental)
Repo.delete_all(User)

Faker.start

# create some owners
owners = Enum.map(1..15, fn n ->
    attrs = %{ 
      name: Faker.Name.name, 
      email: "owner-#{n}@email.com",
      password: "secret" 
    }
    %User{}
    |> User.signup(attrs)
    |> Repo.insert!()
  end
)

# create some renters
renters = Enum.map(1..15, fn n ->
    attrs = %{ 
      name: Faker.Name.name, 
      email: "renter-#{n}@email.com",
      password: "secret" 
    }
    %User{}
    |> User.signup(attrs)
    |> Repo.insert!()
  end
)

# create some rental units + bookings
Enum.map(1..100, fn n ->
    rental = Landbnb.Repo.insert!(
      %Rental{ 
        user: Enum.random(owners),
        rental_type: Enum.random(["house", "apartment"]),
        bathrooms: Enum.random(1..3),
        bedrooms: Enum.random(1..3),
        beds: Enum.random(1..3),
        accommodates: Enum.random(1..5),
        nightly_cost: Enum.random([55.75, 100.25, 113]),
        description: "Very #{Enum.random(["scenic", "beautiful","ugly"])} view.",
        latitude: Faker.Address.latitude,
        longitude: Faker.Address.longitude,
        street1: Faker.Address.street_address,
        city: Faker.Address.city,
        province: Faker.Address.state_abbr,
        country: Faker.Address.country_code,
        postal_code: Faker.Address.postcode
      }
    )

    num_bookings = Enum.random(1..10)

    datetime = Timex.now

    Enum.map(1..num_bookings, fn n ->
        booking = Landbnb.Repo.insert!(
          %Booking{ 
            user: Enum.random(renters),
            rental: rental,
            guests: Enum.random(1..3),
            start_date: Timex.shift(datetime, days: n), 
            stop_date: Timex.shift(datetime, days: n + 3)
          }
        )

        if Enum.random([true, false]) do
          score = Enum.random(1..4)
          
          attrs = %{
            review_score: score,
            review_comments: "I chose a score of #{score}",
            reviewed_at: Timex.shift(booking.stop_date, hours: 2)
          }
  
          booking
          |> Booking.changeset(attrs)
          |> Repo.update()
        end  
      end
    )
  end
)
