defmodule AppWeb.SerializerController do
  use AppWeb, :controller
  alias Serializer

  def new(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"json" => json}) do
    Serializer.json_to_csv(json)
    |> case do
      {:ok, data} ->
        conn
        |> put_flash(:info, "JSON converted successfully.")
        |> render("index.html", content: data)
      {:error, _} ->
        conn
        |> put_flash(:error, "Please insert a valid JSON.")
        |> render("index.html")
    end
  end
end
