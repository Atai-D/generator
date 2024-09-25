defmodule Generator do
  import Ecto.Query
  alias Generator.Repo

  @moduledoc """
  Generator keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def test() do
    Generator.Jobs.Test.create()
  end

  def get_jobs() do
    from(oban_jobs in "oban_jobs",
      as: :oban_jobs,
      where: oban_jobs.errors != [],
      select: %{
        id: oban_jobs.id,
        args: oban_jobs.args,
        attempt: oban_jobs.attempt,
        max_attempts: oban_jobs.max_attempts,
        errors: oban_jobs.errors
      }
    )
    |> Repo.all()
  end
end
