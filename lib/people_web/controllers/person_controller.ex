defmodule PeopleWeb.PersonController do
    use PeopleWeb, :controller

    alias People.Person
    alias People.Repo

    def index(conn, _params) do
  		people = Repo.all(Person)
    	render conn, "index.html", people: people
    end

    def show(conn, %{"id" => id}) do
  		person = Repo.get!(Person,id)
    	render conn, "show.html", person: person
    end

    def new(conn, _params) do
		changeset = Person.changeset(%Person{} ,%{})
		render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"person" => person_params}) do
		changeset = Person.changeset(%Person{}, person_params)

		case Repo.insert(changeset) do 
			{:ok, _person} -> 
				conn
        		|> put_flash(:info, "Person created successfully.")
        		|> redirect(to: person_path(conn, :index))
			{:error, changeset} -> 
				render conn, "new.html", changeset: changeset
		end
    end

    def edit(conn, %{"id" => id}) do
  		person = Repo.get!(Person, id)
  		changeset = Person.changeset(person)

    	render conn, "edit.html", changeset: changeset, person: person
    end

    def update(conn, %{"id" => id, "person" => person_params}) do
		old_person = Repo.get(Person, id)
		changeset = Person.changeset(old_person, person_params)

		case Repo.update(changeset) do
			{:ok, _person} ->
				conn
				|> put_flash(:info, "Person updated successfully.")
				|> redirect(to: person_path(conn, :index))
			{:error, changeset} -> render conn, "edit.html", changeset: changeset, person: old_person
		end
	end
end