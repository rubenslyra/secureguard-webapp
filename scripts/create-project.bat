:: TODO: Corrigir parâmetros de criação de projetos com falhar: "remover class1.cs"

@echo off

:: Retroceder até a raiz do projeto
cd .

:: Criar a pasta para os os códgios e para o Back-end do projeto
mkdir src
cd src/
mkdir Backend
cd Backend/

:: Criar Solução
dotnet new sln -n SecureGuardApp

:: Criar Projetos
dotnet new classlib -n SecureGuardApp.Domain -o SecureGuardApp/Domain
dotnet new classlib -n SecureGuardApp.Application -o SecureGuardApp/Application
dotnet new classlib -n SecureGuardApp.Infrastructure -o SecureGuardApp/Infrastructure
dotnet new web -n SecureGuardApp.API -o SecureGuardApp/API

cd SecureGuardApp
:: Adicionar .gitignore
dotnet new gitignore -o .\Application\
dotnet new gitignore -o .\Domain\
dotnet new gitignore -o .\Infrastructure\
dotnet new gitignore -o .\API\

:: Remove Class1.cs dos Projetos de Classe

del SecureGuardApp/Domain/Class1.cs
del SecureGuardApp/Application/Class1.cs
del SecureGuardApp/Infrastructure/Class1.cs

cd ..

:: Adicionar Projetos à Solução
dotnet sln add SecureGuardApp/Domain/SecureGuardApp.Domain.csproj
dotnet sln add SecureGuardApp/Application/SecureGuardApp.Application.csproj
dotnet sln add SecureGuardApp/Infrastructure/SecureGuardApp.Infrastructure.csproj
dotnet sln add SecureGuardApp/API/SecureGuardApp.API.csproj

:: Conectar Projetos
cd SecureGuardApp/API
dotnet add reference ../Application/SecureGuardApp.Application.csproj
dotnet add reference ../Infrastructure/SecureGuardApp.Infrastructure.csproj
cd ..

cd Application
dotnet add reference ../Domain/SecureGuardApp.Domain.csproj
dotnet add reference ../Infrastructure/SecureGuardApp.Infrastructure.csproj
cd ..

cd Infrastructure
dotnet add reference ../Domain/SecureGuardApp.Domain.csproj
cd ..

:: Restaurar Pacotes
dotnet restore SecureGuardApp/API

:: Finalização
echo Estrutura SecureGuardApp criada com sucesso!
pause