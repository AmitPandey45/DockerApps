using Microsoft.AspNetCore.Http;
using System.Net;

namespace Learning.Common.Validations
{
    public class CustomerValidationMessage
    {
        private static Dictionary<int, string> statusCodeMessage = new Dictionary<int, string>
        {
            { StatusCodes.Status200OK, "Success" },
            { StatusCodes.Status400BadRequest, "Something went wrong" },
            { StatusCodes.Status404NotFound, "not found" },
            { 101, "validation falied" },
            { 102, "Incorrect Input!" },
            { 103, "CreatedBy/ModifiedBy is required!" },
            { StatusCodes.Status204NoContent, "No Content" },
            { StatusCodes.Status500InternalServerError, "Can't process this request" }
        };

        public static Dictionary<int, string> StatusCodeMessage { get => statusCodeMessage; set => statusCodeMessage = value; }
    }
}
