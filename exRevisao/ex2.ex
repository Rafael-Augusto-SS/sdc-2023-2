defmodule Saudacao do
  def run do
    IO.puts "Digite seu nome:"
    nome = IO.gets("")
    IO.puts "Olá, #{String.trim(nome)}!"
  end
end

Saudacao.run()
