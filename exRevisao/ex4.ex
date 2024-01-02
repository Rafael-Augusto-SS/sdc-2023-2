defmodule Calcular do
  def imc(nome, peso, altura) do
    imc = peso / (altura * altura)
    "Olá #{nome}, seu IMC é de #{imc |> Float.round(1) |> Float.to_string}."
  end
end

IO.puts("Digite seu nome:")
nome = IO.gets("") |> String.trim()
IO.puts("Digite seu peso em Kg:")
peso = IO.gets("") |> String.trim() |> String.to_float()
IO.puts("Digite sua altura em metros:")
altura = IO.gets("") |> String.trim() |> String.to_float()

msg = Calcular.imc(nome, peso, altura)
IO.puts(msg)
