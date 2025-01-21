using Learning.Common.Api;
using Microsoft.AspNetCore.Mvc;

namespace DockerAppsDemo.Controllers
{
    [ApiController]
    [Route("api/v{version:apiVersion}/productsv3/")]
    [ApiVersion("3.0")]
    public class ProductsV3Controller : BaseController
    {
        private readonly Dictionary<int, string> products = new Dictionary<int, string>
        {
            { 21, "Product 21" },
            { 22, "Product 22" },
            { 23, "Product 23" }
        };

        public ProductsV3Controller(IHttpContextAccessor contextAccessor)
            : base(contextAccessor)
        {
        }

        [HttpGet]
        [ProducesResponseType(200, Type = typeof(IEnumerable<string>))]
        public IActionResult Get()
        {
            return Ok(products.Select(p => p.Value));
        }

        [HttpGet("{id}")]
        [ProducesResponseType(200, Type = typeof(string))]
        [ProducesResponseType(404)]
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
