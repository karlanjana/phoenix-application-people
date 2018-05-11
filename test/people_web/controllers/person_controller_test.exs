defmodule PeopleWeb.PersonControllerTest do
  use PeopleWeb.ConnCase

  test "index", %{conn: conn} do
    conn = get conn, person_path(conn, :index)
    assert html_response(conn, 200) =~ "People at Sopost"
  end

  
end