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
        IO.puts("3- Atualizar um ponto")
        IO.puts("4- Excluir um ponto")

    opcao = IO.gets(" |> ") |> String.trim() |> String.to_integer()

        case opcao do
        1 -> criar()
        2 -> listar()
        3 -> atualizar()
        4 -> excluir()
        5 -> sair()
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
        menu()
    end

    def atualizar do
        menu()
    end

    def excluir do
        menu()
    end

    def sair do
        IO.puts("Desligando o Sistema CRUD")
    end
end
