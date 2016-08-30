defmodule I18n do
  use Translator

  locale "en",
    flash: [
      hello: "Hello %{first} %{last}!",
      bye: "Goodbye, %{name}!",
    ],
    users: [
      title: "Users"
    ]

  locale "fr",
    flash: [
      hello: "Salue %{first} %{last}!",
      bye: "Au revoir, %{name}!",
    ],
    users: [
      title: "Utilisateurs"
    ]
end
