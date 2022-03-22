defmodule StudyWeb.PostController do
  use StudyWeb, :controller

  alias Study.Posts
  alias Study.Accounts.Post
  alias Study.Accounts
  alias Study.Repo

  def index(conn,_params) do
    posts =Posts.list_posts()
    render(conn,"index.json",posts: posts)
  end
  def create(conn, %{"post" => post_params}) do
      # require IEx
      # IEx.pry()

    with {:ok, %Post{} = post} <- Posts.create_post(post_params) do
      post = Accounts.get_user!(3)|> Repo.preload(:posts)
      # post =post.posts

      # %Post{} = post
      # post =Map.take(post,[:id,:name])
      # post =Map.get(post,:name,:id)
      # post =Map.to_list(post)

      require IEx
      IEx.pry()

      conn
      |> put_status(:created)
      |> render("show.json",post: post)
    end
  end

  def show(conn, %{"id" =>id}) do
   post =Posts.get_post!(id)
    render(conn,"show.json", post: post)
  end
end
