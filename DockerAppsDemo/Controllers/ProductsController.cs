using Microsoft.AspNetCore.Mvc;

namespace DockerAppsDemo.Controllers
{
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/")]
    [ApiVersion("1.0")]
    [ApiVersion("2.0")]
    public class ProductsController : ControllerBase
    {
        private readonly Dictionary<int, string> products = new Dictionary<int, string>
        {
            { 1, "Product 1" },
            { 2, "Product 2" },
            { 3, "Product 3" }
        };

        [HttpGet]
        [ProducesResponseType(200, Type = typeof(IEnumerable<string>))]
        public IActionResult Get()
        {
            return Ok(products.Select(p => p.Value));
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Get(int id)
        {
            if (products.TryGetValue(id, out string product))
            {
                return Ok(product);
            }

            return NotFound();
        }
    }
}
