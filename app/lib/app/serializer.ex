defmodule Serializer do
  alias Jason

  def json_to_csv(json) do
    case parse_json(json) do
      {:ok, data} -> convert_to_csv(data)
      {:error, _} -> {:error, "Unable to render JSON."}
    end
  end

  defp parse_json(json) do
    Jason.decode(json)
  end

  defp convert_to_csv(data) when is_map(data) do
    head = find_records_key(data)

    data[head]
    |> convert_to_csv()
  end

  defp convert_to_csv(list) do
    keys = get_keys(list)
    lines = [write_headers(keys) | write_rows(list, keys)]
    data = Enum.join(lines, "\n")
    {:ok, data}
  end

  defp get_keys(list) do
    hd(list)
    |> Map.keys()
  end

  defp write_headers(keys) do
    Enum.join(keys, ",")
  end

  defp write_rows(list, keys) do
    Enum.map(list, fn x -> process_row(x, keys) end)
  end

  defp process_row(map, keys) do
    for(key <- keys, do: map[key])
    |> Enum.join(",")
  end

  defp find_records_key(map) do
    :maps.filter(fn _, v -> is_list(v) == true end, map)
    |> Map.keys()
    |> hd()
  end
end
