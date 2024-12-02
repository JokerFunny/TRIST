using System.Net;
using Microsoft.AspNetCore.Mvc;

namespace EFKLoggingApiMetrics.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class MaaaahController : ControllerBase
	{
		private readonly ILogger<MaaaahController> _logger;
		public MaaaahController(ILogger<MaaaahController> logger)
		{
			_logger = logger;
		}

		[HttpGet("GetRandomMaaaahValue", Name = "GetRandomMaaaahValue")]
		public int GetRandomMaaaahValue()
		{
			_logger.LogInformation("GetRandomMaaaahValue requested.");

			var randomValue = new Random().Next(0, 100);
			_logger.LogInformation("Maaaaaaaaaaah value is [{RandomMaaaahValue}].", randomValue);

			return randomValue;
		}

		[HttpGet("ThrowErrorMaaaaaahMessage/{id}", Name = "ThrowErrorMaaaaaahMessage")]
		public string ThrowErrorMaaaaaahMessage(int id)
		{
			_logger.LogInformation("ThrowErrorMaaaaaahMessage requested.");

			try
			{
				if (id <= 0)
				{
					Response.StatusCode = (int)HttpStatusCode.Forbidden;
					throw new Exception($"id cannot be less than or equal to 0. Value passed is [{id}].");
				}

				return id.ToString();
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, ex.Message);
			}

			return string.Empty;
		}
	}
}
