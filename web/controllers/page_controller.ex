defmodule Landbnb.PageController do
  use Landbnb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
