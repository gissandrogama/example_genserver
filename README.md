# HelloServer

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hello_server` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hello_server, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/hello_server>.

Instruções de como usar:

- Iniciando o processo:

```elixir
iex> {:ok,pid} = GenServer.start_link(Server, 1,[])
{:ok, #PID<0.152.0>}
```

Aqui inciamos o processo com o valor 1.

- Fazendo chamadas síncronas, usando a função `call`:

```elixir
iex> GenServer.call pid, {:add, 102}
"102 add"
```

Temos como resposta imediata `102 add`, as chamadas `call` bloqueiam o fluxo até receber uma resposta do servidor.
Não percebemos nessa chamada, pois o retorno é imediato. Iremos chamar ao`get` para pegar o resultado.

```elixir
iex> GenServer.call pid, :get
103
```

Observe que o valor foi retornado depois de 2 segundos e o terminal `iex` ficou bloqueado para inserir novas chamadas até receber a resposta.

- Chamada assíncrona:

```elixir
iex> GenServer.cast pid, :reset
:ok
iex>
value has been reset
```

Observe que aqui o foi retornado um `:ok` e o terminal foi liberado para novas chamadas e depois de 2 segundos recebemos uma mensagem.
Dessa forma o fluxo não é bloqueado e podemos realizar novas chamadas.

- Chamadas de informação:

Aqui são todas as chamadas que não são enviadas via `cast` ou `call`, também funcionam de forma assíncrona.

```elixir
iex(5)> send pid, :work
 This message prints every after 2 seconds
:work
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 ...
```

Para sair da impressão continua só executar o comando: `Process.exit(pid,:kill)`


Instructions on how to use:

- Starting the process:

```elixir
iex> {:ok,pid} = GenServer.start_link(Server, 1,[])
{:ok, #PID<0.152.0>}
```

Here we start the process with the value 1.

- Making synchronous calls, using the function `call`:

```elixir
iex> GenServer.call pid, {:add, 102}
"102 add"
```

We have a `102 add` as an immediate response, `call` calls block the flow until it receives a response from the server.
We didn't notice this call, because the return is immediate. We'll call `get` to get the result.

```elixir
iex> GenServer.call pid, :get
103
```

Note that the value was returned after 2 seconds and the `iex` terminal was blocked from inserting new calls until it received the response.

- Asynchronous call:

```elixir
iex> GenServer.cast pid, :reset
:ok
iex>
value has been reset
```

Note that here the `:ok` was returned and the terminal was released for new calls and after 2 seconds we received a message.
This way the flow is not blocked and we can make new calls.

- Information calls:

Here are all calls that are not sent via `cast` or `call`, also work asynchronously.

```elixir
iex(5)> send pid, :work
 This message prints every after 2 seconds
:work
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 This message prints every after 2 seconds
 ...
```

To exit printing, just execute the command: `Process.exit(pid,:kill).
