defmodule Study.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :post, :string

      timestamps()
    end

  end
end
