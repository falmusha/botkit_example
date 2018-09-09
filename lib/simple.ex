defmodule BotKitExample.Simple do
  alias BotKit.{Bot, BotState, Chat}

  @behaviour Bot
  @behaviour BotState

  def start_link(), do: Bot.start_link(__MODULE__, :ok)

  def start_chat(pid), do: Bot.begin(pid)

  def say(pid, text), do: Bot.send(pid, text)

  def init(:ok) do
    {:ok, nil}
  end

  def enter(chat), do: Chat.reply_with(chat, "Hello, I'm a bot")

  def on(chat, "hi"), do: Chat.reply_with(chat, "Hi back")

  def on(chat, _), do: chat

  def pipeline(text), do: String.downcase(text)
end
