defmodule BlockScoutWeb.AddressTransactionView do
  use BlockScoutWeb, :view

  alias BlockScoutWeb.AccessHelpers
  alias Explorer.Chain.Address

  def format_current_filter(filter) do
    case filter do
      "to" -> gettext("Incoming")
      "from" -> gettext("Outoging")
      _ -> gettext("All")
    end
  end
end
