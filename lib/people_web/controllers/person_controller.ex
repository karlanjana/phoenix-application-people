defmodule PeopleWeb.PersonController do
  use PeopleWeb, :controller

  alias People.Person
  alias People.Repo

  def index(conn, _params) do
  	people = Repo.all(Person)
    render conn, "index.html", people: people
  end
end