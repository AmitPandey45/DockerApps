using Learning.Common.Validations;
using System.Text.Json.Serialization;

namespace Learning.Common
{
    public class BO_APIResponse<T>
    {
        [JsonConstructor]
        public BO_APIResponse() { }

        public BO_APIResponse(int code, string method, string message, T data, bool status = true, string uniqueRequestId = null)
        {
            this.MethodName = method;
            this.Status = status;
            this.StatusCode = code;
            this.Message = message;
            this.Result = data;
            this.UniqueRequestId = uniqueRequestId;
        }

        public BO_APIResponse(int code, string method, T data, bool status = true, string uniqueRequestId = null)
        {
            this.MethodName = method;
            this.Status = status;
            this.StatusCode = code;
            this.Message = CustomerValidationMessage.StatusCodeMessage[code];
            this.Result = data;
            this.UniqueRequestId = uniqueRequestId;
        }

        public string MethodName { get; set; }

        public bool Status { get; set; }

        public int StatusCode { get; set; }

        public string Message { get; set; }

        public T Result { get; set; }

        public string UniqueRequestId { get; set; }

        public static explicit operator BO_APIResponse<T>(BO_APIErrorResponse e)
        {
            T outobj = default(T);
            return new BO_APIResponse<T>(e.StatusCode, e.MethodName, e.Message, outobj, e.Status, e.UniqueRequestId);
        }
    }
}
