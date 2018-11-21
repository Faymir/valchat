defmodule Valchat.Message do
  use Valchat.Web, :model

  schema "message" do
    # field :from_id, :integer
    field :to_id, :integer
    field :content, :string


    belongs_to(:user, Valchat.User)
    #belongs_to(:user, Valchat.User, foreign_key: :to_id, references: :id)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:to_id, :content])
    |> validate_required([:to_id, :content])
  end
end
