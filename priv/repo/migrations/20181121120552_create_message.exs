defmodule Valchat.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :user_id, references(:user, column: :id)
      add :to_id, :integer, null: false
      add :content, :text
      add :read_at, :timestamp

      timestamps()
    end
  end
end
