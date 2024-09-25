defmodule Generator.Jobs.Test do
  use Oban.Worker,
    queue: :default,
    max_attempts: 1,
    unique: [
      keys: [:id],
      period: :infinity,
      states: [:available, :scheduled, :executing]
    ]

  def create(id \\ 1) do
    %{id: id}
    |> __MODULE__.new()
    |> Oban.insert()
  end

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id} = _args}) do
    IO.inspect(id)
    :ok
  end
end
