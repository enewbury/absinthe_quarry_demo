# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Espionage.Repo.insert!(%Espionage.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias Espionage.Repo
alias Espionage.{Mission, Agent, Director, Base}

%{id: base_id_1} =
  %Base{
    name: "Belgium"
  }
  |> Repo.insert!()

%{id: base_id_2} =
  %Base{
    name: "Poland"
  }
  |> Repo.insert!()

%{id: base_id_3} =
  %Base{
    name: "Washington"
  }
  |> Repo.insert!()

%{id: director_id_1} =
  %Director{
    name: "Kittridge",
    base_id: base_id_3
  }
  |> Repo.insert!()

%{id: mission_id_1} =
  %Mission{
    title: "Prevent Leak",
    description: "Go to Prague for a mission to prevent the theft of classified material",
    priority: 10,
    director_id: director_id_1
  }
  |> Repo.insert!()

%{id: mission_id_2} =
  %Mission{
    title: "Stop Outbreak",
    description:
      "Go to Sydney to find and destroy a genetically modified disease called 'Chimera'",
    priority: 8,
    director_id: director_id_1
  }
  |> Repo.insert!()

%Agent{
  name: "Ethan Hunt",
  mission_id: mission_id_1,
  base_id: base_id_2
}
|> Repo.insert!()

%Agent{
  name: "Jim Phelps",
  mission_id: mission_id_1,
  base_id: base_id_3
}
|> Repo.insert!()

%Agent{
  name: "Claire",
  mission_id: mission_id_2,
  base_id: base_id_2
}
|> Repo.insert!()

%Agent{
  name: "Krieger",
  mission_id: mission_id_2,
  base_id: base_id_2
}
|> Repo.insert!()
