defmodule StudyWeb.PostController do
  use StudyWeb, :controller

  alias Study.Posts
  alias Study.Accounts.Post


  def index(conn,_params) do
    posts =Posts.list_posts()
    render(conn,"index.json",posts: posts)
  end
  def create(conn, %{"post" => post_params}) do
    with {:ok, %Post{} = post} <- Posts.create_post(post_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.post_path(conn, :show, post))
      |> render("show.json",post: post)
    end
  end

  def show(conn, %{"id" =>id}) do
   post =Posts.get_post!(id)
    render(conn,"show.json", post: post)
  end
end
