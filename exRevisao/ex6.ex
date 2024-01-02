defmodule Dicionario do
  def guardar(n) do
    matriculas_nomes = ler_matriculas__e_nomes(n)
    dicionario = Enum.into(matriculas_nomes, %{})
    IO.inspect(dicionario)
  end

  defp ler_matriculas_e_nomes(n) do
    IO.puts("Digite os pares matrícula/nome (um por linha):")
    Enum.map(1..n, fn _ ->
      {matricula, nome} = matricula_e_nome()
      {matricula, nome}
    end)
  end

  defp matricula_e_nome do
    IO.puts("Matrícula:")
    matricula = IO.gets("") |> String.trim()

    IO.puts("Nome:")
    nome = IO.gets("") |> String.trim()

    {matricula, nome}
  end
end

IO.puts("Digite a quantidade de matrícula/nome:")
qtd = IO.gets("") |> String.trim() |> String.to_integer()

Dicionario.guardar(qtd)
