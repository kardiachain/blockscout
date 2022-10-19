defmodule Explorer.Repo.Migrations.AddKardiaBlockInfo do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add(:block_rewards, :numeric, precision: 100, null: true)
      add(:commit_hash, :bytea, null: true)
      add(:validator_hash, :bytea, null: true)
      add(:next_validator_hash, :bytea, null: true)
      add(:transactions_root, :bytea, null: true)
    end
  end
end
