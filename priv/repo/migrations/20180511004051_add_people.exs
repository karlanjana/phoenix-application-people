defmodule People.Repo.Migrations.AddPeople do
  use Ecto.Migration

  def change do
  	create table(:people) do
  		add :name, :string
  		add :title, :string
  		add :photo, :string
  		add :location, :string

  		timestamps()
  	end
  end
end
