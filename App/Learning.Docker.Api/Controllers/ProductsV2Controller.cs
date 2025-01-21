using Learning.Common.Api;
using Microsoft.AspNetCore.Mvc;

namespace DockerAppsDemo.Controllers
{
    [ApiController]
    [Route("api/v{version:apiVersion}/productsv2/")]
    [ApiVersion("1.0")]
    [ApiVersion("2.0")]
    public class ProductsV2Controller : BaseController
    {
        public ProductsV2Controller(IHttpContextAccessor contextAccessor)
            : base(contextAccessor)
        {
        }

        // Endpoint for v1
        [HttpGet]
        [MapToApiVersion("1.0")]
        public IActionResult GetV1()
        {
            return Ok("This is version 1 endpoint");
        }

        // Endpoint for v2
        [HttpGet]
        [MapToApiVersion("2.0")]
        public IActionResult GetV2()
        {
            return Ok("This is version 2 endpoint");
        }
    }

}
