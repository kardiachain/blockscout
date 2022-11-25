defmodule BlockScoutWeb.ChainView do
  use BlockScoutWeb, :view
  require Logger
  require Decimal
  import Number.Currency, only: [number_to_currency: 2]

  alias BlockScoutWeb.LayoutView
  alias Explorer.Chain.Cache.GasPriceOracle

  defp market_cap(:standard, %{available_supply: available_supply, usd_value: usd_value})
       when is_nil(available_supply) or is_nil(usd_value) do
    Logger.info("Calculate market cap with nil avail supply")
    Decimal.new(0)
  end

  defp market_cap(:standard, %{available_supply: available_supply, usd_value: usd_value}) do
    Logger.info("Calculate market cap with avail supply", supply: inspect(available_supply), usd: inspect(usd_value))
    Decimal.mult(available_supply, usd_value)
  end

  defp market_cap(:standard, exchange_rate) do
    Logger.info("Get in market_cap here")
    exchange_rate.market_cap_usd
  end

  defp market_cap(module, exchange_rate) do
    Logger.info("Get in market_cap here 2")
    module.market_cap(exchange_rate)
  end

  def format_usd_value(nil), do: ""

  def format_usd_value(value) do
    if Decimal.is_decimal(value) do
      "#{format_currency_value(Decimal.to_float(value))} USD"
    else
      "#{format_currency_value(value)} USD"
    end
  end

  def format_currency_value(value, symbol \\ "$")

  def format_currency_value(nil, _symbol), do: ""

  def format_currency_value(%Decimal{} = value, symbol) do
    value
    |> Decimal.to_float()
    |> format_currency_value(symbol)
  end

  def format_currency_value(value, _symbol) when not is_float(value) do
    "N/A"
  end

  def format_currency_value(value, symbol) when is_float(value) and value < 0 do
    "#{symbol}0.00"
  end

  def format_currency_value(value, symbol) when is_float(value) and value < 0.000001 do
    "Less than #{symbol}0.000001"
  end

  def format_currency_value(value, symbol) when is_float(value) and value < 1 do
    "#{number_to_currency(value, unit: symbol, precision: 6)}"
  end

  def format_currency_value(value, symbol) when is_float(value) and value < 100_000 do
    "#{number_to_currency(value, unit: symbol)}"
  end

  def format_currency_value(value, _symbol) when value >= 1_000_000 and value <= 999_000_000 do
    {:ok, value} = Cldr.Number.to_string(value, format: :short, currency: :USD, fractional_digits: 2)
    value
  end

  def format_currency_value(value, symbol) when is_float(value) do
    "#{number_to_currency(value, unit: symbol, precision: 0)}"
  end

  defp gas_prices do
    case GasPriceOracle.get_gas_prices() do
      {:ok, gas_prices} ->
        gas_prices

      nil ->
        nil

      _ ->
        nil
    end
  end
end
