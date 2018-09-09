defmodule BotKitExample.Complex.AskName do
  alias BotKit.{BotState, Chat}

  @behaviour BotState

  def enter(chat) do
    chat
    |> Chat.reply_with("Hi my name is BotKit")
    |> Chat.reply_with("What is your name?")
  end

  def on(chat, [name]) do
    data = chat |> Chat.get_data() |> Map.put(:name, name)

    chat
    |> Chat.put_data(data)
    |> Chat.reply_with("Nice to meet you #{name}")
    |> Chat.goto(:bye)
  end

  def confused(chat, tries, _text) when tries > 2 do
    chat
    |> Chat.reply_with("Hint: any one word will do")
    |> Chat.reset_confused_count()
  end

  def confused(chat, _, text) do
    Chat.reply_with(chat, "Sorry, I'm just want to know your first name")
  end
end
