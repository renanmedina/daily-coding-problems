```elixir
defmodule Debounce do
  @doc """
  Returns a debounced version of the given function `f` by `N` milliseconds.
  The returned function will not call `f` for `N` milliseconds after it was last called.

  Args:
    f (function): The function to debounce.
    N (integer): The delay in milliseconds.

  Returns:
    function: The debounced version of `f`.
  """
  def debounce(f, N) when is_function(f) do
    # Use Process.send_after/2 to schedule the execution of a new process after N milliseconds
    # We use a closure to capture the current value of f
    fn arg ->
      # If we haven't called f yet, call it now
      if arg == :first_call do
        f.()
        :first_call
      else
        # Otherwise, wait for N milliseconds and try again
        Process.send_after(self(), :call, N * 1000)
        :wait
      end

    end | [first_call: :first_call]
  end
end
```