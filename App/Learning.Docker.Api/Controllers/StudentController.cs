using Learning.Common;
using Learning.Common.Api;
using Microsoft.AspNetCore.Mvc;

namespace DockerAppsDemo.Controllers
{
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/")]
    [ApiVersion("1.0")]
    public class StudentController : BaseController
    {
        private Dictionary<int, string> students = new Dictionary<int, string>
        {
            { 1, "Student1" },
            { 2, "Student2" },
            { 3, "Student3" },
            { 4, "Student4" },
            { 5, "Student5" },
            { 6, "Student6" },
            { 7, "Student7" },
        };

        public StudentController(IHttpContextAccessor contextAccessor)
            : base(contextAccessor)
        {
        }

        [HttpGet]
        [Route("")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Dictionary<int, string>))]
        public IActionResult GetStudents()
        {
            var data = students.Select(s => s.Value).ToList();
            return this.Ok(new BO_APIResponse<Dictionary<int, string>>(StatusCodes.Status200OK, "GetStudents", "Get All Students", students, true, "success"));
        }

        [HttpGet]
        [Route("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(string))]
        public IActionResult GetStudent(int id)
        {
            return this.Ok(new BO_APIResponse<string>(StatusCodes.Status200OK, "GetStudent", "Get Student", students[id], true, "success"));
        }
    }
}
