# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias Blog.Repo
alias Blog.{Post, Comment, Author, User}

%{id: user_id_1} =
  %User{
    name: "Eric Newbury"
  }
  |> Repo.insert!()

%{id: user_id_2} =
  %User{
    name: "Luke Skywalker"
  }
  |> Repo.insert!()

%{id: user_id_3} =
  %User{
    name: "Han Solo"
  }
  |> Repo.insert!()

%{id: author_id_1} =
  %Author{
    publisher: "TestDouble",
    user_id: user_id_1
  }
  |> Repo.insert!()

%{id: post_id_1} =
  %Post{
    title: "Getting off the grid",
    body:
      "In this post I’d like to discuss what I view as the most important step away from big tech—the phone.",
    views: 10,
    author_id: author_id_1
  }
  |> Repo.insert!()

%{id: post_id_2} =
  %Post{
    title: "Why functional?",
    body:
      "At some point, you may have looked at an example of a TODO app written functionally...",
    views: 8,
    author_id: author_id_1
  }
  |> Repo.insert!()

%Comment{
  body: "This is really cool!",
  post_id: post_id_1,
  user_id: user_id_2
}
|> Repo.insert!()

%Comment{
  body: "This is garbage!",
  post_id: post_id_1,
  user_id: user_id_3
}
|> Repo.insert!()

%Comment{
  body: "I don't know, how about code written with the 'force' instead?",
  post_id: post_id_2,
  user_id: user_id_2
}
|> Repo.insert!()

%Comment{
  body: "Actually, yeah, this is da best",
  post_id: post_id_2,
  user_id: user_id_2
}
|> Repo.insert!()
