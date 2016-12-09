defmodule Constrictor do
  def main(){
    {:ok, content} = File.read "action.txt"
    acc = Poison.decode!(content, as: %Constrictor.Action{})
    acc.toGenerate
    Enum.count(acc.toGenerate)

  }
end
