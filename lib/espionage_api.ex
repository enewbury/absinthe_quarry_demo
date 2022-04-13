defmodule EspionageApi do
  @moduledoc """
    The entrypoint for defining your api interface

    This can be used in your application as:

        use EspionageApi, :schema

  """

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
