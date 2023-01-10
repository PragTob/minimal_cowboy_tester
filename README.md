# MinimalCowboy

Another script to show client connection closing killing the process in cowboy (or its deps). More minimal version of [cowboy_tester](https://github.com/PragTob/cowboy_tester)

## How to run it?

Easiest, is to take `run.exs` and copy and paste it into `iex -S mix`. The Web server then runs in there.

Now you can go to `localhost:8080/` to do a request and watch the logs come in. Then initiate a request/reload and then hit the X to abort it and then you can see the request not print messages any more.

Interestingly, not even the `terminate` handler is called when this happens, but it is called on "normal" requests.

So, given the following handler code:

```elixir
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
```

I get the following logs:

```
Start processing request
Sending reply
Terminatinggg!
Reason: :normal
partial request: %{bindings: %{}, body_length: 0, cert: :undefined, has_body: false, has_sent_resp: true, headers: %{"accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9", "accept-encoding" => "gzip, deflate, br", "accept-language" => "en-GB,en-US;q=0.9,en;q=0.8", "cache-control" => "max-age=0", "connection" => "keep-alive", "cookie" => "_cowboy_tester_key=SFMyNTY.g3QAAAABbQAAAAtfY3NyZl90b2tlbm0AAAAYcmxBM3A0bnl6VEoxS1h5RXVITng2eVN0.BJ2-0W9J8HhmK8DviY4r46h-6-591OM36H0TPliENAg", "host" => "localhost:8080", "sec-ch-ua" => "\"Not?A_Brand\";v=\"8\", \"Chromium\";v=\"108\", \"Google Chrome\";v=\"108\"", "sec-ch-ua-mobile" => "?0", "sec-ch-ua-platform" => "\"macOS\"", "sec-fetch-dest" => "document", "sec-fetch-mode" => "navigate", "sec-fetch-site" => "cross-site", "sec-fetch-user" => "?1", "upgrade-insecure-requests" => "1", "user-agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"}, host: "localhost", host_info: :undefined, method: "GET", path: "/", path_info: :undefined, peer: {{127, 0, 0, 1}, 50201}, pid: #PID<0.280.0>, port: 8080, qs: "", ref: :my_cowboy_http, scheme: "http", sock: {{127, 0, 0, 1}, 8080}, streamid: 1, version: :"HTTP/1.1"}
State: []
Start processing request
Sending reply
Terminatinggg!
Reason: :normal
partial request: %{bindings: %{}, body_length: 0, cert: :undefined, has_body: false, has_sent_resp: true, headers: %{"accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9", "accept-encoding" => "gzip, deflate, br", "accept-language" => "en-GB,en-US;q=0.9,en;q=0.8", "cache-control" => "max-age=0", "connection" => "keep-alive", "cookie" => "_cowboy_tester_key=SFMyNTY.g3QAAAABbQAAAAtfY3NyZl90b2tlbm0AAAAYcmxBM3A0bnl6VEoxS1h5RXVITng2eVN0.BJ2-0W9J8HhmK8DviY4r46h-6-591OM36H0TPliENAg", "host" => "localhost:8080", "sec-ch-ua" => "\"Not?A_Brand\";v=\"8\", \"Chromium\";v=\"108\", \"Google Chrome\";v=\"108\"", "sec-ch-ua-mobile" => "?0", "sec-ch-ua-platform" => "\"macOS\"", "sec-fetch-dest" => "document", "sec-fetch-mode" => "navigate", "sec-fetch-site" => "cross-site", "sec-fetch-user" => "?1", "upgrade-insecure-requests" => "1", "user-agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"}, host: "localhost", host_info: :undefined, method: "GET", path: "/", path_info: :undefined, peer: {{127, 0, 0, 1}, 50201}, pid: #PID<0.280.0>, port: 8080, qs: "", ref: :my_cowboy_http, scheme: "http", sock: {{127, 0, 0, 1}, 8080}, streamid: 2, version: :"HTTP/1.1"}
State: []
Start processing request
Start processing request
Start processing request
Start processing request
Sending reply
Terminatinggg!
Reason: :normal
partial request: %{bindings: %{}, body_length: 0, cert: :undefined, has_body: false, has_sent_resp: true, headers: %{"accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9", "accept-encoding" => "gzip, deflate, br", "accept-language" => "en-GB,en-US;q=0.9,en;q=0.8", "cache-control" => "max-age=0", "connection" => "keep-alive", "cookie" => "_cowboy_tester_key=SFMyNTY.g3QAAAABbQAAAAtfY3NyZl90b2tlbm0AAAAYcmxBM3A0bnl6VEoxS1h5RXVITng2eVN0.BJ2-0W9J8HhmK8DviY4r46h-6-591OM36H0TPliENAg", "host" => "localhost:8080", "sec-ch-ua" => "\"Not?A_Brand\";v=\"8\", \"Chromium\";v=\"108\", \"Google Chrome\";v=\"108\"", "sec-ch-ua-mobile" => "?0", "sec-ch-ua-platform" => "\"macOS\"", "sec-fetch-dest" => "document", "sec-fetch-mode" => "navigate", "sec-fetch-site" => "cross-site", "sec-fetch-user" => "?1", "upgrade-insecure-requests" => "1", "user-agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"}, host: "localhost", host_info: :undefined, method: "GET", path: "/", path_info: :undefined, peer: {{127, 0, 0, 1}, 50225}, pid: #PID<0.293.0>, port: 8080, qs: "", ref: :my_cowboy_http, scheme: "http", sock: {{127, 0, 0, 1}, 8080}, streamid: 1, version: :"HTTP/1.1"}
State: []
```

So, the multiple `Start processing request` without `Sending reply` or `Terminatinggg!` is when I canceled the requests.
