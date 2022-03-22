defmodule Study.Accounts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Study.Accounts

  schema "posts" do

    field :post, :string
    belongs_to :user, Study.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    user =Accounts.get_user!(3)

    user
    |> Ecto.build_assoc(:posts)

  end

end
