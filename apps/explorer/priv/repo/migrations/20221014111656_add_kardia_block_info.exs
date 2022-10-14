defmodule Explorer.Repo.Migrations.AddKardiaBlockInfo do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add(:block_rewards, :numeric, precision: 100, null: true)
      add(:commit_hash, references(:addresses, column: :hash, type: :bytea), null: true)
      add(:validator_hash, references(:addresses, column: :hash, type: :bytea), null: true)
      add(:next_validator_hash, references(:addresses, column: :hash, type: :bytea), null: true)
      add(:transaction_root, references(:addresses, column: :hash, type: :bytea), null: true)
    end
  end
end
