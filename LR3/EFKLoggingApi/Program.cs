using Serilog;

namespace EFKLoggingApi
{
	public class Program
	{
		public static void Main(string[] args)
		{
			// Configure Serilog using appsettings.json.
			Log.Logger = new LoggerConfiguration()
				.ReadFrom.Configuration(new ConfigurationBuilder()
					.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
					.Build())
				.CreateLogger();

			try
			{
				Log.Information("Starting the application.");

				var builder = WebApplication.CreateBuilder(args);

				// Add Serilog to the application
				builder.Host.UseSerilog();

				// Add services to the container.
				builder.Services.AddControllers();
				builder.Services.AddEndpointsApiExplorer();
				builder.Services.AddSwaggerGen();

				var app = builder.Build();

				// Configure the HTTP request pipeline.
				if (app.Environment.IsDevelopment())
				{
					app.UseSwagger();
					app.UseSwaggerUI();
				}

				app.UseAuthorization();

				app.MapControllers();

				app.Run();
			}
			catch (Exception ex)
			{
				Log.Fatal(ex, "Application startup failed.");
			}
			finally
			{
				Log.CloseAndFlush();
			}
		}
	}
}
