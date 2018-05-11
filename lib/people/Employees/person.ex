defmodule People.Person do 
	use PeopleWeb, :model

	schema "people" do
		field :name, :string
		field :title, :string
		field :photo, :string
		field :location, :string

		timestamps()
	end

	def changeset(struct, params \\ %{}) do 
		struct
		|> cast(params, [:name, :title, :photo, :location])
		|> validate_required([:name, :title, :photo, :location])
	end
end



