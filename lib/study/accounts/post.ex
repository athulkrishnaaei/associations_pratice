defmodule Study.Accounts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do

    field :post, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:post])
    |> validate_required([:post])
  end

end
