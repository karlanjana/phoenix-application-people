# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     People.Repo.insert!(%People.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule People.Seeds do

	alias People.Person
	alias People.Repo
	
	def add_person({:ok ,data_row}) do 
		changeset = Person.changeset(%Person{}, data_row)
		Repo.insert!(changeset)
	end

end

File.stream!("assets/static/people.csv")
	|> Stream.drop(1)
	|> CSV.decode(headers: [:name, :title, :location, :photo])
	|> Enum.each(&People.Seeds.add_person/1)
