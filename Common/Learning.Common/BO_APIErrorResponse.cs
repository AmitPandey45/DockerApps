using Learning.Common.Validations;

namespace Learning.Common
{
    public class BO_APIErrorResponse
    {
        public BO_APIErrorResponse()
        {
        }

        public BO_APIErrorResponse(int code, string method, string message, bool status = false, string uniqueRequestId = null)
        {
            this.MethodName = method;
            this.Status = status;
            this.StatusCode = code;
            this.Message = message;
            this.Result = new List<string> { };
            this.UniqueRequestId = uniqueRequestId;
        }

        public BO_APIErrorResponse(int code, string method, bool status = false, string uniqueRequestId = null)
        {
            this.MethodName = method;
            this.Status = status;
            this.StatusCode = code;
            this.Message = CustomerValidationMessage.StatusCodeMessage[code];
            this.Result = new List<string> { };
            this.UniqueRequestId = uniqueRequestId;
        }

        public string MethodName { get; set; }

        public bool Status { get; set; }

        public int StatusCode { get; set; }

        public string Message { get; set; }

        public List<string> Result { get; set; }

        public string UniqueRequestId { get; set; }
    }
}
