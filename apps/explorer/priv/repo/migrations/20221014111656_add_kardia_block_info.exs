defmodule Explorer.Repo.Migrations.AddKardiaBlockInfo do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add(:block_rewards, :numeric, precision: 100, null: false)
      add(:commit_hash, references(:addresses, column: :hash, type: :bytea), null: false)
      add(:validator_hash, references(:addresses, column: :hash, type: :bytea), null: false)
      add(:next_validator_hash, references(:addresses, column: :hash, type: :bytea), null: false)
      add(:transaction_root, references(:addresses, column: :hash, type: :bytea), null: false)
    end
  end
end
