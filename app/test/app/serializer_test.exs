defmodule SerializerTest do
  use ExUnit.Case
  alias Jason

  describe "json_to_csv/1" do
    test "converts a flat JSON" do
      list = [%{:id => 1, :name => "Johnson"}, %{:id => 2, :name => "Sam"}]
      json = Jason.encode!(list)

      assert Serializer.json_to_csv(json) == {:ok, ~s(id,name\n1,Johnson\n2,Sam)}
    end

    test "converts a JSON containing a records key" do
      map = %{:result => [%{:id => 1, :name => "Johnson"}]}
      json = Jason.encode!(map)

      assert Serializer.json_to_csv(json) == {:ok, ~s(id,name\n1,Johnson)}
    end
  end
end
