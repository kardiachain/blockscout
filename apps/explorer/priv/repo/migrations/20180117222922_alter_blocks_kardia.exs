defmodule Explorer.Repo.Migrations.AlterBlocksKardia do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add(:commit_hash, :bytea)
      add(:validator_hash, :bytea)
      add(:next_validator_hash, :bytea)
      add(:transactions_root, :bytea)
      add(:block_rewards, :numeric, precision: 100)
    end
  end
end
