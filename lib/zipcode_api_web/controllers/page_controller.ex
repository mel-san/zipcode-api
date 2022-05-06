defmodule ZipcodeApiWeb.PageController do
  use ZipcodeApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
