defmodule Explorer.Repo.Migrations.AddAppHash do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add_if_not_exists(:app_hash, :bytea)
    end
  end
end
