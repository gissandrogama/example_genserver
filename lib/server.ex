defmodule Server do
  use GenServer

  ## Server API
  # initiating the state with the value 1 passed
  def init(initial_value) do
    {:ok, initial_value}
  end

  # add the value to the state and returns :ok
  def handle_call({:add, value}, _from, state) do
    {:reply, "#{value} add", state + value}
  end

  # returns the state to the caller
  def handle_call(:get, _from, state) do
    :timer.sleep(2000)
    {:reply, state, state}
  end

  # just reset the state to value 1
  def handle_cast(:reset, state) do
    :timer.sleep(2000)
    IO.puts("value has been reset ")
    {:noreply, 1}
  end

  # This executes periodically
  def handle_info(:work, state) do
    IO.puts(" This message prints every after 2 seconds")
    schedule_work()
    {:noreply, state}
  end

  # catch-all clause for the handle_info for handling unkown messages
  def handle_info(_msg, state) do
    IO.puts("unknown message")
    {:noreply, state}
  end

  defp schedule_work() do
    # In 2 seconds
    Process.send_after(self(), :work, 2 * 1000)
  end
end
