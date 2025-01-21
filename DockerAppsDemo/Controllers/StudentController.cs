using Microsoft.AspNetCore.Mvc;

namespace DockerAppsDemo.Controllers
{
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]/")]
    [ApiVersion("1.0")]
    public class StudentController : ControllerBase
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

        [HttpGet]
        [Route("")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<string>))]
        public IActionResult GetStudents()
        {
            return this.Ok(students.Select(s => s.Value).ToList());
        }

        [HttpGet]
        [Route("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(string))]
        public IActionResult GetStudent(int id)
        {
            return this.Ok(students[id]);
        }
    }
}
