defmodule AppWeb.SerializerControllerTest do
  use AppWeb.ConnCase

  test "GET /json-to-csv", %{conn: conn} do
    conn = get(conn, "/json-to-csv")
    assert html_response(conn, 200) =~ "JSON to CSV converter"
  end
end
