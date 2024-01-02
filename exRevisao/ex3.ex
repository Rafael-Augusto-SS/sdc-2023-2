defmodule SuaAltura do
  def run do
    IO.puts "Digite seu nome:"
    nome = IO.gets("")

    IO.puts "Digite seu ano de nascimento:"
    ano_nascimento = IO.gets("")

    idade = Date.utc_today().year() - String.trim(ano_nascimento) |> Integer.parse() |> elem(0)

    IO.puts "Olá, #{String.trim(nome)}, você tem #{idade} anos."
  end
end

SuaAltura.run()
