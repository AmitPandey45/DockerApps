using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Moq;

namespace Docker.Api.Tests.Startup
{
    [TestFixture]
    public class BaseConfigurationTest
    {
        protected Mock<IHttpContextAccessor> contextAccessor;
        protected Mock<ILogger> logger;

        [OneTimeSetUp]
        public void BaseSetConfiguration()
        {
            this.contextAccessor = new Mock<IHttpContextAccessor>();
            this.logger = new Mock<ILogger>();
        }

        [OneTimeTearDown]
        public void BaseClearConfiguration()
        {

        }
    }
}
