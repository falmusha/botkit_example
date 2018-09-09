defmodule BotKitExample.Complex.Bye do
  alias BotKit.{BotState, Chat}

  @behaviour BotState

  def enter(chat) do
    name = chat |> Chat.get_data() |> Map.get(:name)

    Chat.reply_with(chat, "It was nice talking to you #{name}. Thanks")
  end

  def on(chat, _) do
    Chat.reply_with(chat, "I'm done talking to you")
  end
end
