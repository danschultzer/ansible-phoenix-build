defmodule AnsiblePhoenixBuild.ReleaseTasks do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:ansible_phoenix_build)

    path = Application.app_dir(:ansible_phoenix_build, "priv/repo")

    IO.puts "Running migrations..."
    Ecto.Migrator.run(AnsiblePhoenixBuild.Repo, path <> "/migrations", :up, all: true)

    :init.stop()
  end
end