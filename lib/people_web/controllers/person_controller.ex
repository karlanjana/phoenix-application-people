defmodule PeopleWeb.PersonController do
  use PeopleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end