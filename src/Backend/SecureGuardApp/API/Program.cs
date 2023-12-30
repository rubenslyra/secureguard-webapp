var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/api/v1", () => "API Inicializada com sucesso! 🚀");

app.Run();
