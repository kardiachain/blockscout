defmodule Explorer.Repo.Migrations.AlterBlockFields do
  use Ecto.Migration

  def up do
    alter table(:blocks) do
      add(:block_rewards, :numeric, precision: 100)
      add(:commit_hash, :bytea, null: true)
      add(:validator_hash, :bytea, null: true)
      add(:next_validator_hash, :bytea, null: true)
      add(:transaction_root, :bytea, null: true)
    end
  end

  def down do
    alter table(:blocks) do
      remove(:block_rewards)
      remove(:commit_hash)
      remove(:validator_hash)
      remove(:next_validator_hash)
      remove(:transaction_root)
    end
  end
end
