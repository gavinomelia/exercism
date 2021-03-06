defmodule Phone do
  def number(raw) do
    clean(raw) |> valid_check
  end

  defp valid_check(clean_num) when byte_size(clean_num) == 10, do: clean_num
  defp valid_check("1" <> rest) when byte_size(rest) == 10, do: rest
  defp valid_check(_), do: "0000000000"

  defp clean(raw), do: String.replace(raw, ~r/(\W)/, "")

  def area_code(raw) do
    String.slice(number(raw), 0..2)
  end

  def slice_number(raw, range) do
    String.slice(number(raw), range)
  end

  def pretty(raw) do
    "(#{area_code(raw)}) #{slice_number(raw, 3..5)}-#{slice_number(raw, 6..10)}"
  end
end
