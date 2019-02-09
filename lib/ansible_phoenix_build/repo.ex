defmodule AnsiblePhoenixBuild.Repo do
  use Ecto.Repo,
    otp_app: :ansible_phoenix_build,
    adapter: Ecto.Adapters.Postgres
end
