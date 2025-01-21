using Docker.Api.Tests.Startup;
using DockerAppsDemo.Controllers;
using Learning.Common.Api;
using Learning.Common;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Docker.Api.Tests.Controllers
{
    [TestFixture]
    public class StudentControllerTest : BaseConfigurationTest
    {
        private StudentController studentController;

        [OneTimeSetUp]
        public void SetConfiguration()
        {
            studentController = new StudentController(this.contextAccessor.Object);
        }

        [Test]
        public void GetStudents_Call_ReturnAllStudents()
        {
            IActionResult actionResult = studentController.GetStudents();
            var response = ResponseMethod.HttpResponseResult<BO_APIResponse<Dictionary<int, string>>>(actionResult);

            Assert.That(response.Result.Count > 0);
        }

        [Test]
        public void GetStudent_Call_ReturnStudent()
        {
            IActionResult actionResult = studentController.GetStudent(1);
            var response = ResponseMethod.HttpResponseResult<BO_APIResponse<string>>(actionResult);

            Assert.IsNotNull(response.Result);
        }

        [OneTimeTearDown]
        public void ClearConfiguration()
        {

        }
    }
}
