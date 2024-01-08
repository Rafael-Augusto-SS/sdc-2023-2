defmodule Crud do
  @menu "
  Menu do sistema
  +++++++++++++++++++++++
  1. Criar uma nova coordenada
  2. Listar as coordenadas
  3. Atualizar uma coordenada
  4. Excluir uma coordenada
  5. Sair do sistema
  +++++++++++++++++++++++
  Entre com sua opção: "

  def criar(lista) do
    [x , y] = IO.gets("Digite os pares de coordenadas x e y (formato: x y): ")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    coordenadas = [{x , y}]
    IO.puts("Coordenadas criadas com sucesso.")
    IO.inspect(coordenadas ++ lista)
    coordenadas ++ lista
  end

  def listar(lista) do
    IO.puts("Função para listar as coordenadas.")
    Enum.each(lista, &IO.inspect/1)
    IO.puts("Função listar")
    IO.inspect(lista)
    lista
  end

  def atualizar(lista) do
    IO.puts("Função Atualizar coordenada")

    [x, y] = IO.gets("Digite o par que você deseja atualizar (formato: x y):") |> String.trim |> String.split() |> Enum.map(&String.to_integer/1)

    indice = Enum.find_index(lista, fn v -> v == {x, y} end)
    IO.inspect(indice)

    [a, b] = IO.gets("Digite o novo par (formato: x y):") |> String.trim |> String.split() |> Enum.map(&String.to_integer/1)

    IO.inspect([a, b])
    nova_lista = List.replace_at(lista, indice, {a, b})

    lista = nova_lista
    lista
  end

  def excluir(lista) do
    IO.puts("Função Excluir uma coordenada")

    [x, y] = IO.gets("Digite o par que você deseja excluir (formato: x y):")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    nova_lista = lista |> List.delete({x , y}) |> IO.inspect()

    nova_lista
  end

  def sair do
    IO.puts("Desligando o Sistema CRUD")
  end

  def menu(lista) do
    option = IO.gets(@menu) |> String.trim() |> String.to_integer()

    case option do
      1 -> menu(criar(lista))
      2 -> menu(listar(lista))
      3 -> menu(atualizar(lista))
      4 -> menu(excluir(lista))
      5 -> sair()
      _ -> IO.puts("Opção inválida")
             menu(lista)
    end
  end
end

Crud.menu([])
