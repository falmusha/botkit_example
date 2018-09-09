defmodule BotKitExample.Complex do
  alias BotKit.Bot

  @behaviour Bot

  def start_link() do
    Bot.start_link(__MODULE__, :ok,
      states: [
        name?: BotKitExample.Complex.AskName,
        bye: BotKitExample.Complex.Bye
      ]
    )
  end

  def start_chat(pid), do: Bot.begin(pid)

  def say(pid, text), do: Bot.send(pid, text)

  def init(:ok) do
    {:ok, %{}}
  end

  def pipeline(text) do
    text
    |> String.downcase()
    |> String.split()
  end
end
