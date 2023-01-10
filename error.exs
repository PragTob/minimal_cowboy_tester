[
  {CowboyHandler, :init,
   [
     %{
       bindings: %{},
       body_length: 0,
       cert: :undefined,
       has_body: false,
       headers: %{
         "accept" =>
           "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
         "accept-encoding" => "gzip, deflate, br",
         "accept-language" => "en-GB,en-US;q=0.9,en;q=0.8",
         "cache-control" => "max-age=0",
         "connection" => "keep-alive",
         "cookie" =>
           "_cowboy_tester_key=SFMyNTY.g3QAAAABbQAAAAtfY3NyZl90b2tlbm0AAAAYcmxBM3A0bnl6VEoxS1h5RXVITng2eVN0.BJ2-0W9J8HhmK8DviY4r46h-6-591OM36H0TPliENAg",
         "host" => "localhost:8080",
         "sec-ch-ua" =>
           "\"Not?A_Brand\";v=\"8\", \"Chromium\";v=\"108\", \"Google Chrome\";v=\"108\"",
         "sec-ch-ua-mobile" => "?0",
         "sec-ch-ua-platform" => "\"macOS\"",
         "sec-fetch-dest" => "document",
         "sec-fetch-mode" => "navigate",
         "sec-fetch-site" => "cross-site",
         "sec-fetch-user" => "?1",
         "upgrade-insecure-requests" => "1",
         "user-agent" =>
           "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
       },
       host: "localhost",
       host_info: :undefined,
       method: "GET",
       path: "/",
       path_info: :undefined,
       peer: {{127, 0, 0, 1}, 50006},
       pid: self(),
       port: 8080,
       qs: "",
       ref: :my_cowboy_http,
       scheme: "http",
       sock: {{127, 0, 0, 1}, 8080},
       streamid: 1,
       version: :"HTTP/1.1"
     },
     []
   ], []},
  {:cowboy_handler, :execute, 2,
   [file: '/Users/tobi/github/minimal_cowboy/deps/cowboy/src/cowboy_handler.erl', line: 37]},
  {:cowboy_stream_h, :execute, 3,
   [file: '/Users/tobi/github/minimal_cowboy/deps/cowboy/src/cowboy_stream_h.erl', line: 306]},
  {:cowboy_stream_h, :request_process, 3,
   [file: '/Users/tobi/github/minimal_cowboy/deps/cowboy/src/cowboy_stream_h.erl', line: 295]},
  {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 240]}
]
