defmodule SistemaCRUD do
    defstruct x: 0, y: 0
    @pontos %{}

    def iniciar do
        menu()
    end

    def menu do
        IO.puts("sistema CRUD")
        IO.puts("++++++++++++")
        IO.puts("1- Criar um ponto")
        IO.puts("2- Listar os pontos")
        IO.puts("3- Atualizar pontos")
        IO.puts("4- Excluir um ponto")
        IO.puts("5- Translação de pontos")
        IO.puts("6- Escala")
        IO.puts("7- Rotação dos pontos")
        IO.puts("8- Reflexão")
        IO.puts("9- Sair")
        IO.puts(" ")

    opcao = IO.gets(" |> ") |> String.trim() |> String.to_integer()

        case opcao do
        1 -> criar()
        2 -> listar()
        3 -> atualizar()
        4 -> excluir()
        5 -> translacao()
        6 -> escala()
        7 -> rotacao()
        8 -> reflexao()
        9 -> sair()
        _ -> menu()
        end
    end

    def criar do
        IO.puts("Função para criar um ponto")
        IO.puts("Digite um numero de indentificação para o ponto")
        num = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        IO.puts("Digite a coordenada X:")
        x = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        IO.puts("Digite a coordenada Y:")
        y = IO.gets(" |> ") |> String.trim() |> String.to_integer()

        @pontos = Map.put(@pontos, num, %SistemaCRUD{x: x, y: y})
        IO.puts("Ponto criado com sucesso!")
        menu()
    end

    def listar do
        IO.puts("Função para criar um ponto")

        pontos = @pontos

        Enum.each(Map.keys(pontos), fn num ->
        ponto = Map.get(pontos, num)
        IO.puts("Ponto #{num}: x = #{ponto.x}, y = #{ponto.y}")
        end)

        menu()
    end

    def atualizar do
        IO.puts("Função Atualizar Pontos")
        IO.puts("Digite o número do ponto a ser atualizado:")
        num = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        ponto = Map.get(@pontos, num)

        if ponto do
          IO.puts("Digite a nova coordenada x:")
          x = IO.gets(" |> ") |> String.trim() |> String.to_integer()

          IO.puts("Digite a nova coordenada y:")
          y = IO.gets(" |> ") |> String.trim() |> String.to_integer()
          ponto = %SistemaCRUD{x: x, y: y}

          @pontos = Map.put(@pontos, nun, ponto)

          IO.puts("Ponto atualizado com sucesso!")
        else
          IO.puts("Ponto não encontrado.")
        end

        menu()
    end

    def excluir do
        IO.puts("Função Excluir um Ponto")
        IO.puts("Digite o número do ponto a ser excluído:")
        num = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        ponto = Map.get(@pontos, num)

        if ponto do
          @pontos = Map.delete(@pontos, num)

          IO.puts("Ponto excluído com sucesso!")
        else
          IO.puts("Ponto não encontrado.")
        end

        menu()
    end

    def translacao do
        IO.puts("Função Translação de pontos")
        IO.puts("Digite o número do ponto a ser transladado:")
        num = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        ponto = Map.get(@pontos, num)

        if ponto do
          IO.puts("Digite o fator de translação em x:")
          tx = IO.gets(" |> ") |> String.trim() |> String.to_integer()

          IO.puts("Digite o fator de translação em y:")
          ty = IO.gets(" |> ") |> String.trim() |> String.to_integer()
          ponto = %SistemaCRUD{x: ponto.x + tx, y: ponto.y + ty}

          @pontos = Map.put(@pontos, num, ponto)

          IO.puts("Translação realizada com sucesso!")
        else
          IO.puts("Ponto não encontrado.")
        end

        menu()
      end

      def escala do
        IO.puts("Função Escala")
        IO.puts("Digite o número do ponto a ser escalado:")
        num = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        ponto = Map.get(@pontos, num)

        if ponto do
          IO.puts("Digite o fator de escala em x:")
          sx = IO.gets(" |> ") |> String.trim() |> String.to_float()

          IO.puts("Digite o fator de escala em y:")
          sy = IO.gets(" |> ") |> String.trim() |> String.to_float()
          ponto = %SistemaCRUD{x: ponto.x * sx, y: ponto.y * sy}

          @pontos = Map.put(@pontos, num, ponto)

          IO.puts("Escala realizada com sucesso!")
        else
          IO.puts("Ponto não encontrado.")
        end

        menu()
      end

      def rotacao do
        IO.puts("Função Rotação dos pontos")
        IO.puts("Digite o número do ponto a ser rotacionado:")
        num = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        ponto = Map.get(@pontos, num)

        if ponto do
          IO.puts("Digite o ângulo de rotação em graus:")
          angulo = IO.gets(" |> ") |> String.trim() |> String.to_float()
          radianos = angulo * Math.PI / 180.0
          {novo_x, novo_y} = {
            ponto.x * Math.cos(radianos) - ponto.y * Math.sin(radianos),
            ponto.x * Math.sin(radianos) + ponto.y * Math.cos(radianos)
          }
          ponto = %SistemaCRUD{x: novo_x, y: novo_y}

          @pontos = Map.put(@pontos, num, ponto)

          IO.puts("Rotação realizada com sucesso!")
        else
          IO.puts("Ponto não encontrado.")
        end

        menu()
    end

    def reflexao do
        IO.puts("Função Reflexão")
        IO.puts("Digite o número do ponto a ser refletido:")
        num = IO.gets(" |> ") |> String.trim() |> String.to_integer()
        ponto = Map.get(@pontos, num)

        if ponto do
          IO.puts("Escolha o eixo de reflexão:")
          IO.puts("1. Reflexão do eixo x")
          IO.puts("2. Reflexão do eixo y")
          opcao = IO.gets(" |> ") |> String.trim() |> String.to_integer()

          case opcao do
            1 -> ponto = %SistemaCRUD{x: ponto.x, y: -ponto.y}
            2 -> ponto = %SistemaCRUD{x: -ponto.x, y: ponto.y}
            _ -> IO.puts("Opção inválida.")
          end

          @pontos = Map.put(@pontos, num, ponto)

          IO.puts("Reflexão realizada com sucesso!")
        else
          IO.puts("Ponto não encontrado.")
        end

        menu()
    end

    def sair do
        IO.puts("Desligando o Sistema CRUD")
    end
end
