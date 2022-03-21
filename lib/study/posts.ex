defmodule Study.Posts do
  import Ecto.Query, warn: false
  alias Study.Repo

  alias Study.Accounts.Post

  def list_posts do
    Repo.all(Post)
  end

  def get_post!(id),do: Repo.get!(Post, id)

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end
end
