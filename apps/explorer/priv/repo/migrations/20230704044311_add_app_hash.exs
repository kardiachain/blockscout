defmodule Explorer.Repo.Migrations.AddAppHash do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add_if_not_exists(:app_hash, :bytea)
      add_if_not_exists(:block_rewards, :numeric, precision: 100)
      add_if_not_exists(:commit_hash, :bytea, null: true)
      add_if_not_exists(:validator_hash, :bytea, null: true)
      add_if_not_exists(:next_validator_hash, :bytea, null: true)
      add_if_not_exists(:transactions_root, :bytea, null: true)
    end
  end
end
