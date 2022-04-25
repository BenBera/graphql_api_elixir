defmodule BookStoreApi.Metrics.Schema do
  @doc "Defines Ecto.Changeset validations."
  @callback create_changeset(map) :: Ecto.Changeset.t()
end

defmodule BookStoreApi.Schema do
  @moduledoc """
  Defination of macros for setting up a schema.

  #### Usage
  Sets up boilerplate for mapping raw metrics to Schema.t() structs.

  `create_changeset/1` has to be declared, defining all the Ecto.Changeset validations required to perform on the said data before mapping to actual Schema.

  Setup an `embedded_schema` with the required fields.
  Make sure to add new fields in the schema to `BookStoreApi.Metrics.Summary` schema as well for summary updates of newly added data.
  Check `BookStoreApi.Metrics.Summary` for more details.
  """

  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset

      @type t :: %__MODULE__{}
      @behaviour BookStoreApi.Metrics.Schema

      def new(params) when is_map(params), do: params |> create_changeset() |> apply_changes()
      def new([_ | _] = params), do: Enum.map(params, &new(&1))
      def new(_), do: new(%{})
    end
  end
end
