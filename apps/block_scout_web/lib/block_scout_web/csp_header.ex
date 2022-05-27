defmodule BlockScoutWeb.CSPHeader do
  @moduledoc """
  Plug to set content-security-policy with websocket endpoints
  """

  alias Phoenix.Controller
  alias Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    Controller.put_secure_browser_headers(conn, %{
      "content-security-policy" => "\
        connect-src 'self' #{websocket_endpoints(conn)} https://raw.githubusercontent.com/kardiachain/token-assets/;\
        default-src 'self';\
        script-src 'self' 'sha256-IBxcGAt2latSKF1Je/SHpNwTeU5Q1WKiBVNd13xlAiA=' 'sha256-fqGNTzWau5hfYKKH3B59dBNOSh8VdaIQ5YXzH+9C0Ys=' 'sha256-89/1LLiXXHmqi3EdeHqEQ7Kz1VVc+6OXCUaen1kiUfg=' 'sha256-whIQUF4JEIB+ZBZ/ml/I0GDURCAMg5P2mSWr3aE/knc='  https://www.google.com https://www.gstatic.com;\
        style-src 'self' 'sha256-N6tSydZ64AHCaOWfwKbUhxXx2fRFDxHOaL3e3CO7GPI=' 'sha256-biLFinpqYMtWHmXfkA1BPeCY0/fNt46SAZ+BBk5YUog=' https://fonts.googleapis.com;\
        img-src 'self' * data:;\
        media-src 'self' * data:;\
        font-src 'self' https://fonts.gstatic.com data:;\
        frame-src 'self' https://www.google.com;\
      "
    })
  end

  defp websocket_endpoints(conn) do
    host = Conn.get_req_header(conn, "host")
    "ws://#{host} wss://#{host}"
  end
end
