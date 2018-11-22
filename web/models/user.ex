defmodule Valchat.User do
  use Valchat.Web, :model

  schema "user" do
    field :username, :string
    field :email, :string
    field :password, :string


    has_many(:message, Valchat.Message, on_delete: :delete_all)
    timestamps()
  end

    @doc """
    Builds a changeset based on the `struct` and `params`.
    """
    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:username, :email, :password])
      |> validate_required([:username, :email, :password])
    end

    def registration_changeset(model, params) do
      model
      |> changeset(params)
      |> cast(params, ~w(password), [])
      |> validate_length(:password, min: 6)
      |> put_password_hash()
    end

    defp put_password_hash(changeset) do
      # case changeset do
      #   %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
      #     put_change(changeset, :password_hash, Valchat.Comeonin.Bcrypt.hashpwsalt(pass))
      #
      #   _ ->
          changeset
      # end
    end
end
