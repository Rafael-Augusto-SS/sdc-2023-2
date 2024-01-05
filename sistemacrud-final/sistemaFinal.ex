defmodule SistemaCrud do
  @menu "
  Menu do sistema
  +++++++++++++++++++++++
  1. Criar uma nova coordenada
  2. Listar as coordenadas
  3. Atualizar uma coordenada
  4. Excluir uma coordenada
  5. Translacao das coordenadas
  6. Escala do polígono
  7. Reflexão do polígono
  8. Deslizamento
  9. Sair do sistema
  +++++++++++++++++++++++
  Entre com sua opção: "

  def criar(lista) do
    coordenadas = IO.gets("Digite os pares de coordenadas x e y (formato: x y): ")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(2, 2, :discard)

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

    indice = Enum.find_index(lista, fn v -> v == [x, y] end)
    IO.inspect(indice)

    [a, b] = IO.gets("Digite o novo par (formato: x y):") |> String.trim |> String.split() |> Enum.map(&String.to_integer/1)

    IO.inspect([a, b])
    nova_lista = List.replace_at(lista, indice, [a, b])

    lista = nova_lista
    lista
  end

  def excluir(lista) do
    IO.puts("Função Excluir uma coordenada")

    ponto = IO.gets("Digite o par que você deseja excluir (formato: x y):")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    nova_lista = lista |> List.delete(ponto) |> IO.inspect()

    nova_lista
  end

  def translacao(lista) do
    IO.puts("Função para realizar a translacao.")
    [dx, dy] = IO.gets("Digite os valores de translação (formato: dx dy): ")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    transladar = fn [x, y] -> [x + dx, y + dy] end

    nova_lista = Enum.map(lista, transladar)

    IO.inspect(nova_lista)
    nova_lista
  end

  def escala(lista) do
    IO.puts("Função para mudar escala do polígono.")
    [sx, sy] = IO.gets("Digite os fatores de escala (formato: sx sy): ")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    escalar = fn [x, y] -> [x * sx, y * sy] end

    nova_lista = Enum.map(lista, escalar)

    IO.inspect(nova_lista)
    nova_lista
  end

  def reflecao(lista) do
    IO.puts("Função para refletir um polígono.")
    IO.puts("1. Reflexão ao longo do eixo X")
    IO.puts("2. Reflexão ao longo do eixo Y")
    IO.puts("3. Reflexão ao longo dos 2 eixos: XY")
    option1 = IO.gets("Entre com sua opção: ") |> String.trim() |> String.to_integer()
    refletir =
      case option1 do
        1 -> fn [x, y] -> [x, -y] end
        2 -> fn [x, y] -> [-x, y] end
        3 -> fn [x, y] -> [-x, -y] end
        _ -> IO.puts("Opção inválida")
             reflecao(lista)
      end

    nova_lista = Enum.map(lista, refletir)

    IO.inspect(nova_lista)
    nova_lista
  end

  def deslizamento(lista) do
    IO.puts("Função para realizar uma distorção na direção de X ou Y")
    IO.puts("1. Distorção na direção X")
    IO.puts("2. Distorção na direção Y")

    option1 = IO.gets("Entre com sua opção: ") |> String.trim() |> String.to_integer()

    [sh_x, sh_y] =
      IO.gets("Digite um valor de distorção para X e Y (formato: sh_x sh_y): ")
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    deslizar =
      case option1 do
        1 -> fn [x, y] -> [x + sh_x * y, y] end
        2 -> fn [x, y] -> [x, y + sh_y * x] end
        _ -> IO.puts("Opção inválida")
             deslizamento(lista)
      end

    nova_lista = Enum.map(lista, deslizar)

    IO.inspect(nova_lista)
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
      5 -> menu(translacao(lista))
      6 -> menu(escala(lista))
      7 -> menu(reflecao(lista))
      8 -> menu(deslizamento(lista))
      9 -> sair()
      _ -> IO.puts("Opção inválida")
             menu(lista)
    end
  end
end

SistemaCrud.menu([])
