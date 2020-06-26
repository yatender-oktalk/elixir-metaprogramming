defmodule ControlFlow do
  defmacro my_if(expression, do: if_block), do: if(expression, do: if_block, else: nil)

  defmacro my_if(expression, do: if_block, else: else_block) do
    quote do
      case unquote(expression) do
        result when result in [false, nil] ->
          unquote(else_block)

        _ ->
          unquote(if_block)
      end
    end
  end
end
