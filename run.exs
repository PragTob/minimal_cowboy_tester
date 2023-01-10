defmodule CowboyHandlaaaa do
  def init(req, state) do
    IO.puts("Start processing request")

    :timer.sleep(5000)

    IO.puts("Sending reply")

    req =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/html"},
        "<h1>Hello World!</h1>",
        req
      )

    {:ok, req, state}
  end

  def terminate(reason, partial_request, state) do
    IO.puts("Terminatinggg!")
    IO.puts("Reason: #{inspect(reason)}")
    IO.puts("partial request: #{inspect(partial_request)}")
    IO.puts("State: #{inspect(state)}")

    :ok
  end
end

dispatch_config =
  :cowboy_router.compile([
    {:_,
     [
       {'/', CowboyHandlaaaa, []}
     ]}
  ])

{:ok, _} =
  :cowboy.start_clear(:my_cowboy_http, [{:port, 8080}], %{env: %{dispatch: dispatch_config}})
