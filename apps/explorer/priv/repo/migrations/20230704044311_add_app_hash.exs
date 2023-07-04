defmodule Explorer.Repo.Migrations.AddAppHash do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add(:app_hash, :bytea)
    end
  end
end
